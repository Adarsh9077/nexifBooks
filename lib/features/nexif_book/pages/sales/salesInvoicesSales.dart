import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/custom_text_field.dart';
import 'package:nexifbook/common/widget/height_spacer.dart';
import 'package:nexifbook/common/widget/width_spacer.dart';
import 'package:nexifbook/features/nexif_book/widgets/app_bar.dart';

class SalesInvoicesSales extends ConsumerStatefulWidget {
  const SalesInvoicesSales({super.key});

  @override
  ConsumerState<SalesInvoicesSales> createState() => _SalesInvoicesSalesState();
}

class _SalesInvoicesSalesState extends ConsumerState<SalesInvoicesSales> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(title: "Sales Invoice", isHomePage: false),
      backgroundColor: AppConst.kLight,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0XFF4096FF),
        onPressed: () {},
        child: Icon(Icons.add, color: AppConst.kLight, size: 30),
      ),
      body: Container(
        padding: EdgeInsets.all(AppConst.kPadding),
        child: Column(
          children: [
            CustomTextField(
              controller: searchController,
              width: screenSize.width,
              hintText: "Search",
              hintStyle: appStyle(20, FontWeight.w400, AppConst.kGreyLight),
            ),
            HeightSpacer(height: 12),
            ToggleButtons(
              constraints: BoxConstraints(
                maxWidth: screenSize.width * 0.46,
                minWidth: screenSize.width * 0.455,
                minHeight: 46,
                maxHeight: 50,
              ),
              borderRadius: BorderRadius.circular(8),
              isSelected: [true, false],
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Invoices"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Items"),
                ),
              ],
              onPressed: (index) {
                // switch tab
                print(index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
