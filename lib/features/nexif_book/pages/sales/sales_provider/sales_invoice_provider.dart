import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexifbook/features/auth/services/auth_service.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/sales_modal/sales_invoice_modal.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/sales_modal/sales_invoice_response.dart';

// final salesInvoiceProvider =
//     FutureProvider.family<List<SalesInvoicesModal>, String>((ref, query) async {
//       final data = await AuthService.getSalesInvoices(query: query,);
//       return data['results'].map<SalesInvoicesModal>((index) {
//         return SalesInvoicesModal(
//           invoiceId: index["id"],
//           invoiceNumber: index["number"].toString(),
//           invoiceDate: index["date"].toString(),
//           totalAmount: index["totalAmount"].toString(),
//           customer: index["customer"]["name"].toString(),
//         );
//       }).toList();
//     });
// use state Notifier ...

final salesInvoiceProvider =
    StateNotifierProvider<
      SalesInvoiceNotifier,
      AsyncValue<SalesInvoiceResponse>
    >((ref) => SalesInvoiceNotifier());

class SalesInvoiceNotifier
    extends StateNotifier<AsyncValue<SalesInvoiceResponse>> {
  SalesInvoiceNotifier() : super(const AsyncValue.loading());

  String query = "";
  String? currentPageUrl;

  Future<void> fetchInvoices({String search = ""}) async {
    try {
      state = const AsyncValue.loading();
      query = search;
      currentPageUrl = null;
      final response = await AuthService.getSalesInvoices(query: search);
      state = AsyncValue.data(response);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> goToPage(String? pageUrl) async {
    if (pageUrl == null) return;
    try {
      state = const AsyncValue.loading();
      currentPageUrl = pageUrl;
      final response = await AuthService.getSalesInvoices(pageUrl: pageUrl);
      state = AsyncValue.data(response);
    } catch (e, st) {}
  }
}
