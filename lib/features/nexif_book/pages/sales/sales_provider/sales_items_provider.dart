import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexifbook/features/auth/services/auth_service.dart';
import '../sales_modal/sales_item_response.dart';

final salesItemsProvider =
StateNotifierProvider<SalesItemsController, AsyncValue<SalesItemResponse?>>(
      (ref) => SalesItemsController(ref)..fetchInvoices(),
);

class SalesItemsController extends StateNotifier<AsyncValue<SalesItemResponse?>> {
  SalesItemsController(this.ref) : super(const AsyncValue.loading());

  final Ref ref;
  String searchQuery = "";
  int currentPage = 1; // NEW: track current page

  Future<void> fetchInvoices({String? pageUrl, String? pageNo}) async {
    state = const AsyncValue.loading();
    try {
      final data = await AuthService.getSalesItems(
        query: searchQuery,
        pageUrl: pageUrl,
        pageNo: pageNo ?? "$currentPage", // NEW: use current page
      );
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void updateSearch(String query) {
    searchQuery = query;
    currentPage = 1; // NEW: reset to first page on new search
    fetchInvoices();
  }

  void goNext() {
    final current = state.value;
    if (current != null && current.next != null) {
      currentPage++;
      fetchInvoices(pageNo: "$currentPage");
    }
  }

  void goPrevious() {
    if (currentPage > 1) {
      currentPage--;
      fetchInvoices(pageNo: "$currentPage");
    }
  }

  void goToPage(pageNo) {
    currentPage = int.tryParse(pageNo) ?? 1; // NEW: update page state
    fetchInvoices(pageNo: pageNo);
  }
}
