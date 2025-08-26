import 'package:nexifbook/features/nexif_book/pages/sales/sales_modal/sales_invoice_modal.dart';

class SalesInvoiceResponse {
  const SalesInvoiceResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int count;
  final String next;
  final String previous;
  final List<SalesInvoicesModal> results;

  factory SalesInvoiceResponse.fromJson(Map<String, dynamic> json) {
    return SalesInvoiceResponse(count: json['count'],
        next: json["next"],
        previous: json['previous'],
        results: json['results']);
  }
}
