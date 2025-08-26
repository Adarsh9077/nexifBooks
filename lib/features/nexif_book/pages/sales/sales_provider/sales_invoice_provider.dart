import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexifbook/features/auth/services/auth_service.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/sales_modal/sales_invoice_modal.dart';

final salesInvoiceProvider =
    FutureProvider.family<List<SalesInvoicesModal>, String>((ref, query) async {
      final data = await AuthService.getSalesInvoices(query: query);
      return data.map<SalesInvoicesModal>((index) {
        return SalesInvoicesModal(
          invoiceId: index["id"],
          invoiceNumber: index["number"].toString(),
          invoiceDate: index["date"].toString(),
          totalAmount: index["totalAmount"].toString(),
          customer: index["customer"]["name"].toString(),
        );
      }).toList();
    });
