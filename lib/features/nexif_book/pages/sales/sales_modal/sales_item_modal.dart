import 'dart:convert';

class SalesItemModal {
  int? invoiceId;
  String? itemName;
  String? invoiceNumber;
  String? invoiceDate;
  String? customer;
  String? batch;
  double? mrp;
  double? quantity;
  double? discount;
  double? totalBeforeTax;
  double? gst;
  double? totalAfterTax;

  SalesItemModal({
    this.invoiceId,
    this.itemName,
    this.invoiceNumber,
    this.invoiceDate,
    this.customer,
    this.batch,
    this.mrp,
    this.quantity,
    this.discount,
    this.totalBeforeTax,
    this.gst,
    this.totalAfterTax,
  });

  SalesItemModal.fromJson(Map<String, dynamic> json) {
    invoiceId = json['invoiceId'];
    itemName = json['itemName'];
    invoiceNumber = json['invoiceNumber'];
    invoiceDate = json['invoiceDate'];
    customer = json['customer'];
    batch = json["batch"];
    mrp = json["mrp"];
    quantity = json["quantity"];
    discount = json["discount"];
    totalBeforeTax = json["totalBeforeTax"];
    gst = json["gst"];
    totalAfterTax = json["totalAfterTax"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoiceId'] = this.invoiceId;
    data['invoiceNumber'] = this.invoiceNumber;
    data['invoiceDate'] = this.invoiceDate;
    data['customer'] = this.customer;
    data['batch'] = this.batch;
    data['mrp'] = this.mrp;
    data['quantity'] = this.quantity;
    data['discount'] = this.discount;
    data['totalBeforeTax'] = this.totalBeforeTax;
    data['gst'] = this.gst;
    data['totalAfterTax'] = this.totalAfterTax;
    return data;
  }

  @override
  String toString() => jsonEncode(toJson());
}
