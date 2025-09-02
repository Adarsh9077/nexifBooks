import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/widget/custom_text_field.dart';
import 'package:nexifbook/features/nexif_book/widgets/app_bar.dart';

import '../../../../common/utils/constants.dart';
import '../../../../common/widget/app_style.dart';

class AddNewInvoice extends ConsumerStatefulWidget {
  const AddNewInvoice({super.key});

  @override
  ConsumerState<AddNewInvoice> createState() => _AddNewInvoiceState();
}

class _AddNewInvoiceState extends ConsumerState<AddNewInvoice> {
  TextEditingController invoiceNumberController = TextEditingController();
  TextEditingController invoiceDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(title: "Add New Sales Invoice", isHomePage: false),
      backgroundColor: AppConst.kLight,
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: invoiceNumberController,
              width: size.width,
              hintText: "Invoice Number*",
              hintStyle: appStyle(20, FontWeight.w400, AppConst.kGreyLight),
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: invoiceDateController,
              width: size.width,
              hintText: "Invoice Date*",
              hintStyle: appStyle(20, FontWeight.w400, AppConst.kGreyLight),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.calendar_month,
                  size: 32,
                  color: AppConst.kBlueLight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
