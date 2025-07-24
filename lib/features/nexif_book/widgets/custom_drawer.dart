import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/expansion_tile_custom.dart';
import 'package:nexifbook/common/widget/height_spacer.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';
import 'package:nexifbook/common/widget/width_spacer.dart';
import 'package:nexifbook/features/nexif_book/widgets/drawer_page_tile.dart';

class CustomDrawer extends ConsumerWidget {
  CustomDrawer({super.key});

  final List<Map<String, dynamic>> drawerItems = [
    {
      "title": "Dashboard",
      "icon": Icons.dashboard,
      "children": [
        {
          "pageTitle": "Purchase",
          "icon": Icons.shopping_bag_outlined,
          "pageDescription": "Purchase Description",
          "pageLink": "",
        },
        {
          "pageTitle": "Sales",
          "icon": Icons.show_chart,
          "pageDescription": "Sales Description",
          "": "",
        },
      ],
    },
    {
      "title": "Sales",
      "icon": Icons.trending_up,
      "children": [
        {
          "pageTitle": "Customers",
          "icon": Icons.people_alt,
          "pageDescription": "Customers Description",
          "": "",
        },
        {
          "pageTitle": "Sales Invoices",
          "icon": Icons.receipt_long,
          "pageDescription": "Sales Invoice Description",
          "": "",
        },
        {
          "pageTitle": "Sales Returns",
          "icon": Icons.keyboard_return,
          "pageDescription": "Sales Return Description",
          "": "",
        },
      ],
    },
    {
      "title": "Purchase",
      "icon": Icons.shopping_cart,
      "children": [
        {
          "pageTitle": "Vendors",
          "icon": Icons.storefront,
          "pageDescription": "Vendor Description",
          "": "",
        },
        {
          "pageTitle": "Purchase Invoices",
          "icon": Icons.receipt,
          "pageDescription": "Purchase Invoice Description",
          "": "",
        },
        {
          "pageTitle": "Purchase Returns",
          "icon": Icons.undo,
          "pageDescription": "Purchase Return Description",
          "": "",
        },
      ],
    },
    {
      "title": "Stock",
      "icon": Icons.inventory,
      "children": [
        {
          "pageTitle": "Items",
          "icon": Icons.category,
          "pageDescription": "Items Description",
          "": "",
        },
        {
          "pageTitle": "Current Stock",
          "icon": Icons.inventory_2,
          "pageDescription": "Current Stock Description",
          "": "",
        },
      ],
    },
    {
      "title": "Accounting",
      "icon": Icons.account_balance,
      "children": [
        {
          "pageTitle": "Ledger",
          "icon": Icons.book,
          "pageDescription": "Ledger Description",
          "": "",
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: AppConst.kLight,
      elevation: 2,
      width: AppConst.kWidth * 0.85,
      child: ListView(
        padding: EdgeInsets.all(AppConst.kPadding),
        children: [
          HeightSpacer(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: AppConst.kRadius * 3.5,
                backgroundColor: AppConst.kBlueLight,
                child: ReusableText(
                  text: "AK",
                  style: appStyle(
                    AppConst.kFontSize * 1.75,
                    FontWeight.w600,
                    AppConst.kLight,
                  ),
                ),
              ),
              WidthSpacer(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  ReusableText(
                    text: "Abhinav Kaul",
                    style: appStyle(
                      AppConst.kFontSize,
                      FontWeight.bold,
                      AppConst.kBKDark,
                    ),
                  ),
                  ReusableText(
                    text: "abhinav16nexif@gmail.com",
                    style: appStyle(
                      AppConst.kFontSize * 0.9375,
                      FontWeight.w500,
                      AppConst.kBKDark,
                    ),
                  ),
                ],
              ),
            ],
          ),
          HeightSpacer(height: 10),
          Divider(color: AppConst.kGreyDk, thickness: .25),
          HeightSpacer(height: 10),
          for (int i = 0; i < drawerItems.length; i++)
            ExpansionTileCustom(
              title: "${drawerItems[i]["title"]}",
              leading: Icon(drawerItems[i]["icon"]),
              children: [
                for (int j = 0; j < drawerItems[i]["children"].length; j++)
                  DrawerPageTile(
                    pageTitle: "${drawerItems[i]["children"][j]["pageTitle"]}",
                    pageDescription:
                        "${drawerItems[i]["children"][j]["pageDescription"]}",
                    leadingIcon: drawerItems[i]["children"][j]["icon"],
                    onTap: () {},
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
