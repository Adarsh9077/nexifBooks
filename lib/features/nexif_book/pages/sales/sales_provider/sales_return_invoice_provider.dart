import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexifbook/features/auth/services/auth_service.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/sales_modal/sales_invoice_response.dart';

final salesReturnInvoiceProvider =
StateNotifierProvider<SalesReturnInvoiceController, AsyncValue<SalesInvoiceResponse?>>(
      (ref) => SalesReturnInvoiceController(ref)..fetchInvoices(),
);

class SalesReturnInvoiceController extends StateNotifier<AsyncValue<SalesInvoiceResponse?>> {
  SalesReturnInvoiceController(this.ref) : super(const AsyncValue.loading());

  final Ref ref;
  String searchQuery = "";
  int currentPage = 1;

  Future<void> fetchInvoices({String? pageUrl, String? pageNo}) async {
    state = const AsyncValue.loading();
    try {
      final data = await AuthService.getSalesReturnInvoice(
        query: searchQuery,
        pageUrl: pageUrl,
        pageNo: pageNo ?? "$currentPage",
      );
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void updateSearch(String query) {
    searchQuery = query;
    currentPage = 1;
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
      currentPage--; // NEW: decrement page counter
      fetchInvoices(pageNo: "$currentPage");
    }
  }

  void goToPage(pageNo) {
    currentPage = int.tryParse(pageNo) ?? 1; // NEW: update page state
    fetchInvoices(pageNo: pageNo);
  }
}
