import 'package:flutter/material.dart';

// import 'package:flutter/cupertino.dart';

class Routes {
  static const String purchaseDashBoard = 'purchaseDashBoard';
  static const String salesDashBoard = 'salesDashBoard';
  static const String customersSales = 'customersSales';
  static const String salesInvoicesSales = 'salesInvoicesSales';
  static const String salesReturnsSales = 'salesReturnsSales';
  static const String vendorPurchase = 'vendorPurchase';
  static const String purchaseInvoicesPurchase = 'purchaseInvoicesPurchase';
  static const String purchaseReturnsPurchase = 'purchaseReturnsPurchase';
  static const String itemsStock = 'itemsStock';
  static const String currentStock = 'currentStock';
  static const String ledger = 'ledgerAccounting';

  static Route<dynamic> onGenerateRoute(RouteSettings settings){
switch(settings.name){
  case purchaseDashBoard:
    return MaterialPageRoute(builder: (context) => )
}
  }
}
