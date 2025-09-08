import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../auth/services/auth_service.dart';
import '../sales_modal/invoice_bill_to_modal.dart';

final invoiceDateProvider = StateProvider<String>((ref) {
  return DateTime.now().toString().substring(0, 10);
});

final invoiceBillToProvider = FutureProvider<List<InvoiceBillToModal>>((
  ref,
) async {
  try {
    final response = await AuthService.getInvoiceBillTo();
    final List<dynamic> data = response["results"];
    return data.map((item) => InvoiceBillToModal.fromJson(item)).toList();
  } catch (e) {
    rethrow;
  }
});

final selectedBillToProvider = StateProvider<String>((ref) {
  return "Select Bill To";
});

final billToDetailsProvider =
    FutureProvider.family<Map<String, dynamic>, String>((ref, billToId) async {
      if (billToId == "Select Bill To") {
        return {};
      }
      return await AuthService.getBillToDetails(billToId);
    });
