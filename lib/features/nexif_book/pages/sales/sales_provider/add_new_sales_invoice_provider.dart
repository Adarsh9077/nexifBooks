import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/sales_modal/items_sales_modal.dart';
import '../../../../auth/services/auth_service.dart';
import '../sales_modal/invoice_bill_to_modal.dart';
import '../sales_modal/items_state.dart';

final invoiceDateProvider = StateProvider<String>((ref) {
  return DateTime.now().toString().substring(0, 10);
});

final invoiceBillToProvider =
    FutureProvider.autoDispose<List<InvoiceBillToModal>>((ref) async {
      final response = await AuthService.getInvoiceBillTo();
      final List<dynamic> data = response["results"];
      return data.map((item) => InvoiceBillToModal.fromJson(item)).toList();
    });

final selectedBillToProvider = StateProvider.autoDispose<String>((ref) {
  return "Select Bill To";
});

final billToDetailsProvider = FutureProvider.family
    .autoDispose<Map<String, dynamic>, String>((ref, billToId) async {
      if (billToId == "Select Bill To") {
        return {};
      }
      return await AuthService.getBillToDetails(billToId);
    });

final selectedTableItemProvider = StateProvider.autoDispose<String>((ref) {
  return "";
});

final fetchListOfItemsProvider = FutureProvider.family
    .autoDispose<List<ItemsSalesModal>, String>((ref, query) async {
      return await AuthService.fetchListOfItemsOld(query: query);
    });

class ItemsNotifier extends StateNotifier<AsyncValue<ItemsState>> {
  ItemsNotifier(this.ref) : super(const AsyncValue.data(ItemsState()));

  final Ref ref;
  String _query = "";
  bool _isFetching = false;

  Future<void> fetchItems({String query = "", bool refresh = false}) async {
    if (_isFetching) return;
    _isFetching = true;

    if (refresh) {
      state = const AsyncValue.loading();
      _query = query;
    } else {
      final current = state.value;
      if (current == null || current.next == null) {
        _isFetching = false;
        return;
      }
    }

    try {
      final current = state.value;
      final page = refresh ? 1 : ((current?.items.length ?? 0) ~/ 10 + 1);

      final result = await AuthService.fetchListOfItemsResponse(
        query: _query,
        page: page,
      );
      final newItems = result["results"] as List<ItemsSalesModal>;
      final next = result["next"] as String?;

      final merged = refresh
          ? newItems
          : <ItemsSalesModal>[...(current?.items ?? []), ...newItems];

      state = AsyncValue.data(ItemsState(items: merged, next: next));
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    } finally {
      _isFetching = false;
    }
  }

  Future<void> loadMore() async {
    await fetchItems(query: _query);
  }

  void reset() {
    state = const AsyncValue.data(ItemsState());
    _query = "";
  }
}

final itemsProvider =
    StateNotifierProvider<ItemsNotifier, AsyncValue<ItemsState>>(
      (ref) => ItemsNotifier(ref),
    );
