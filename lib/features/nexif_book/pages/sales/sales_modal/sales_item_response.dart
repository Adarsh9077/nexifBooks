import 'sales_item_modal.dart';

class SalesItemResponse {
  const SalesItemResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  final int count;
  final String? next;
  final String? previous;
  final List<SalesItemModal> results;

  factory SalesItemResponse.fromJson(Map<String, dynamic> json) {
    return SalesItemResponse(
      count: json['count'] ?? 0,
      next: json["next"],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>)
          .map<SalesItemModal>((item) {
            print("${item["sku"]["name"]} \n00000");
        return SalesItemModal(
          invoiceId: item["sku_id"],
          itemName: item["sku"]?["name"] ?? "",
          invoiceNumber: item["sales_invoice"]?["number"] ?? "",
          invoiceDate: item["sales_invoice"]?["date"] ?? "",
          customer: item["customer"]?["name"] ?? "",
          batch: item["batch"] ?? "",
          mrp: item["mrp"] ?? 0,
          quantity: item["pre_conv_qty"] ?? 0,
          discount: item["discount"] ?? 0,
          totalBeforeTax: item["total_before_tax"] ?? 0,
          gst: item["gst_rate"] ?? 0,
          totalAfterTax: item["total_after_tax"] ?? 0,
        );
      }).toList(),
    );
  }
}
