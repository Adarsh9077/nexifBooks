import 'package:flutter/material.dart';
import 'package:nexifbook/features/nexif_book/pages/dashboard/purchaseDashboard.dart';
import 'package:nexifbook/features/nexif_book/pages/dashboard/salesDashboard.dart';
import 'package:nexifbook/features/nexif_book/pages/homepage.dart';
import 'package:nexifbook/features/nexif_book/pages/purchase/purchaseInvoicesPurchase.dart';
import 'package:nexifbook/features/nexif_book/pages/purchase/purchaseReturnsPurchase.dart';
import 'package:nexifbook/features/nexif_book/pages/purchase/vendorPurchase.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/customersSales.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/salesInvoicesSales.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/salesReturnsSales.dart';
import 'package:nexifbook/features/nexif_book/pages/stock/currentStock.dart';
import 'package:nexifbook/features/nexif_book/pages/stock/itemsStock.dart';

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

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case purchaseDashBoard:
        return MaterialPageRoute(builder: (context) => PurchaseDashboard());
      case salesDashBoard:
        return MaterialPageRoute(builder: (context) => SalesDashboard());
      case customersSales:
        return MaterialPageRoute(builder: (context) => CustomersSales());
      case salesInvoicesSales:
        return MaterialPageRoute(builder: (context) => SalesInvoicesSales());
      case salesReturnsSales:
        return MaterialPageRoute(builder: (context) => SalesReturnsSales());
      case vendorPurchase:
        return MaterialPageRoute(builder: (context) => VendorPurchase());
      case purchaseInvoicesPurchase:
        return MaterialPageRoute(
          builder: (context) => PurchaseInvoicesPurchase(),
        );
      case purchaseReturnsPurchase:
        return MaterialPageRoute(
          builder: (context) => PurchaseReturnsPurchase(),
        );
      case itemsStock:
        return MaterialPageRoute(builder: (context) => ItemsStock());
      case currentStock:
        return MaterialPageRoute(builder: (context) => CurrentStock());
      default:
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }
}
