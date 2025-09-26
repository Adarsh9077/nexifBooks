// class ListOfItemsModal {
//   int? id;
//   int? itemId;
//   String? item;
//   String? hsnCode;
//   String? batchNo;
//   String? mfgDate;
//   String? expDate;
//   int? mrp;
//   int? qty;
//   int? discount;
//   int? rate;
//   int? taxableAmt;
//   int? gstRate;
//   int? totalAmt;
//
//   ListOfItemsModal(
//       {this.id,
//         this.itemId,
//         this.item,
//         this.hsnCode,
//         this.batchNo,
//         this.mfgDate,
//         this.expDate,
//         this.mrp,
//         this.qty,
//         this.discount,
//         this.rate,
//         this.taxableAmt,
//         this.gstRate,
//         this.totalAmt});
//
//   ListOfItemsModal.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     itemId = json['item_id'];
//     item = json['item'];
//     hsnCode = json['hsn_code'];
//     batchNo = json['batch_no'];
//     mfgDate = json['mfg_date'];
//     expDate = json['exp_date'];
//     mrp = json['mrp'];
//     qty = json['qty'];
//     discount = json['discount'];
//     rate = json['rate'];
//     taxableAmt = json['taxable_amt'];
//     gstRate = json['gst_rate'];
//     totalAmt = json['total_amt'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['item_id'] = this.itemId;
//     data['item'] = this.item;
//     data['hsn_code'] = this.hsnCode;
//     data['batch_no'] = this.batchNo;
//     data['mfg_date'] = this.mfgDate;
//     data['exp_date'] = this.expDate;
//     data['mrp'] = this.mrp;
//     data['qty'] = this.qty;
//     data['discount'] = this.discount;
//     data['rate'] = this.rate;
//     data['taxable_amt'] = this.taxableAmt;
//     data['gst_rate'] = this.gstRate;
//     data['total_amt'] = this.totalAmt;
//     return data;
//   }
// }

import 'dart:convert';

class ListOfItemsModal {
  final int id;
  final int itemId;
  final String item;
  final String hsnCode;
  final String batchNo;
  final String mfgDate;
  final String expDate;
  final double mrp;
  final double qty;
  final double discount;
  final double rate;
  final double taxableAmt;
  final double gstRate;
  final double totalAmt;

  ListOfItemsModal({
    required this.id,
    required this.itemId,
    required this.item,
    required this.hsnCode,
    required this.batchNo,
    required this.mfgDate,
    required this.expDate,
    required this.mrp,
    required this.qty,
    required this.discount,
    required this.rate,
    required this.taxableAmt,
    required this.gstRate,
    required this.totalAmt,
  });

  ListOfItemsModal copyWith({
    int? id,
    int? itemId,
    String? item,
    String? hsnCode,
    String? batchNo,
    String? mfgDate,
    String? expDate,
    double? mrp,
    double? qty,
    double? discount,
    double? rate,
    double? taxableAmt,
    double? gstRate,
    double? totalAmt,
  }) => ListOfItemsModal(
    id: id ?? this.id,
    itemId: itemId ?? this.itemId,
    item: item ?? this.item,
    hsnCode: hsnCode ?? this.hsnCode,
    batchNo: batchNo ?? this.batchNo,
    mfgDate: mfgDate ?? this.mfgDate,
    expDate: expDate ?? this.expDate,
    mrp: mrp ?? this.mrp,
    qty: qty ?? this.qty,
    discount: discount ?? this.discount,
    rate: rate ?? this.rate,
    taxableAmt: taxableAmt ?? this.taxableAmt,
    gstRate: gstRate ?? this.gstRate,
    totalAmt: totalAmt ?? this.totalAmt,
  );

  factory ListOfItemsModal.fromRawJson(String str) =>
      ListOfItemsModal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListOfItemsModal.fromJson(Map<String, dynamic> json) =>
      ListOfItemsModal(
        id: json["id"],
        itemId: json["item_id"],
        item: json["item"],
        hsnCode: json["hsn_code"],
        batchNo: json["batch_no"],
        mfgDate: json["mfg_date"],
        expDate: json["exp_date"],
        mrp: json["mrp"],
        qty: json["qty"],
        discount: json["discount"],
        rate: json["rate"],
        taxableAmt: json["taxable_amt"],
        gstRate: json["gst_rate"],
        totalAmt: json["total_amt"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "item_id": itemId,
    "item": item,
    "hsn_code": hsnCode,
    "batch_no": batchNo,
    "mfg_date": mfgDate,
    "mrp": mrp,
    "qty": qty,
    "discount": discount,
    "rate": rate,
    "taxable_amt": taxableAmt,
    "gst_rate": gstRate,
    "total_amt": totalAmt,
  };
}
