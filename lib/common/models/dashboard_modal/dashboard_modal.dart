import 'dart:convert';

class DashboardPurchaseSales {
  final int skuId;
  final String skuName;
  final int qty;
  final double amount;

  DashboardPurchaseSales({
    required this.skuId,
    required this.skuName,
    required this.qty,
    required this.amount,
  });

  factory DashboardPurchaseSales.fromRawJson(String str) =>
      DashboardPurchaseSales.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DashboardPurchaseSales.fromJson(Map<String, dynamic> json) =>
      DashboardPurchaseSales(
        skuId: json["sku_id"],
        skuName: json["sku_name"],
        qty: json["qty"],
        amount: json["amount"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
    "sku_id": skuId,
    "sku_name": skuName,
    "qty": qty,
    "amount": amount,
  };
}
