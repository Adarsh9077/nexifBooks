import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/sales_modal/items_sales_modal.dart';
import '../../../../auth/services/auth_service.dart';
import '../sales_modal/invoice_bill_to_modal.dart';

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

class ItemsNotifier extends StateNotifier<AsyncValue<List<ItemsSalesModal>>> {
  ItemsNotifier(this.ref) : super(const AsyncValue.data([]));

  final Ref ref;
  int _page = 1;
  bool _hasNext = true;
  String _query = "";
  bool _isFetching = false;

  Future<void> fetchItems({String query = "", bool refresh = false}) async {
    if (_isFetching) return; // prevent duplicate calls
    _isFetching = true;

    if (refresh) {
      state = const AsyncValue.loading();
      _page = 1;
      _hasNext = true;
      _query = query;
    }

    if (!_hasNext) {
      _isFetching = false;
      return;
    }

    try {
      final result = await AuthService.fetchListOfItems(
        query: _query,
        page: _page,
      );

      final newItems = result["results"] as List<ItemsSalesModal>;
      final next = result["next"];

      _hasNext = next != null;
      _page++;

      state = AsyncValue.data([
        if (!refresh) ...state.value ?? [],
        ...newItems,
      ]);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    } finally {
      _isFetching = false;
    }
  }

  Future<void> loadMore() async {
    await fetchItems();
  }

  void reset() {
    state = const AsyncValue.data([]);
    _page = 1;
    _hasNext = true;
  }
}

final itemsProvider =
StateNotifierProvider<ItemsNotifier, AsyncValue<List<ItemsSalesModal>>>(
      (ref) => ItemsNotifier(ref),
);
