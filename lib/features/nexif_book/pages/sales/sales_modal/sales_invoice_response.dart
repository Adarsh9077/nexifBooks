import 'sales_invoice_modal.dart';

class SalesInvoiceResponse {
  const SalesInvoiceResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  final int count;
  final String? next; // <-- nullable
  final String? previous; // <-- nullable
  final List<SalesInvoicesModal> results;

  factory SalesInvoiceResponse.fromJson(Map<String, dynamic> json) {
    return SalesInvoiceResponse(
      count: json['count'] ?? 0,
      next: json["next"],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>).map<SalesInvoicesModal>((
        index,
      ) {
        return SalesInvoicesModal(
          invoiceId: index["id"],
          invoiceNumber: index["number"]?.toString() ?? "",
          invoiceDate: index["date"]?.toString() ?? "",
          totalAmount: index["totalAmount"]?.toString() ?? "0",
          customer: index["customer"]?["name"]?.toString() ?? "Unknown",
        );
      }).toList(),
    );
  }
}
