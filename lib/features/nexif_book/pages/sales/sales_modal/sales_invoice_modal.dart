import 'dart:convert';

class SalesInvoicesModal {
  int? invoiceId;
  String? invoiceNumber;
  String? invoiceDate;
  String? customer;
  String? totalAmount;

  SalesInvoicesModal({
    this.invoiceId,
    this.invoiceNumber,
    this.invoiceDate,
    this.customer,
    this.totalAmount,
  });

  SalesInvoicesModal.fromJson(Map<String, dynamic> json) {
    invoiceId = json['invoiceId'];
    invoiceNumber = json['invoiceNumber'];
    invoiceDate = json['invoiceDate'];
    customer = json['customer'];
    totalAmount = json['totalAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoiceId'] = this.invoiceId;
    data['invoiceNumber'] = this.invoiceNumber;
    data['invoiceDate'] = this.invoiceDate;
    data['customer'] = this.customer;
    data['totalAmount'] = this.totalAmount;
    return data;
  }

  @override
  String toString() => jsonEncode(toJson());
}
