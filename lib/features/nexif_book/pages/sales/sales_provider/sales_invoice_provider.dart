import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexifbook/features/auth/services/auth_service.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/sales_modal/sales_invoice_modal.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/sales_modal/sales_invoice_response.dart';

// final salesInvoiceProvider =
//     FutureProvider.family<List<SalesInvoiceResponse>, String>((ref, query) async {
//       final data = await AuthService.getSalesInvoices(query: query,);
//      for (SalesInvoicesModal index  in data.results){
//        print(index.customer);
//      }
//       return data.map<SalesInvoiceResponse>((index) {
//         return SalesInvoiceResponse(
//           count: index["count"],
//           next: index["next"],
//           previous: index["previous"],
//           results: index["results"]
//           // invoiceId: index["id"],
//           // invoiceNumber: index["number"].toString(),
//           // invoiceDate: index["date"].toString(),
//           // totalAmount: index["totalAmount"].toString(),
//           // customer: index["customer"]["name"].toString(),
//         );
//       }).toList();
//     });
// use state Notifier ...

final salesInvoiceProvider =
    StateNotifierProvider<
      SalesInvoiceController,
      AsyncValue<SalesInvoiceResponse?>
    >((ref) => SalesInvoiceController(ref)..fetchInvoices());

class SalesInvoiceController
    extends StateNotifier<AsyncValue<SalesInvoiceResponse?>> {
  SalesInvoiceController(this.ref) : super(const AsyncValue.loading());

  final Ref ref;
  String searchQuery = "";

  Future<void> fetchInvoices({String? pageUrl}) async {
    state = const AsyncValue.loading();
    try {
      final data = await AuthService.getSalesInvoices(
        query: searchQuery,
        pageUrl: pageUrl,
      );
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void updateSearch(String query) {
    searchQuery = query;
    fetchInvoices();
  }

  void goNext() {
    final current = state.value;
    if (current != null && current.next != null) {
      fetchInvoices(pageUrl: current.next);
    }
  }

  void goPrevious() {
    final current = state.value;
    if (current != null && current.previous != null) {
      fetchInvoices(pageUrl: current.previous);
    }
  }
}
