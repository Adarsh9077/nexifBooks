import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/widget/height_spacer.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';
import 'package:nexifbook/features/nexif_book/widgets/app_bar.dart';
import '../../../../common/utils/constants.dart';
import '../../../../common/widget/app_style.dart';
import 'widgets/add_new_sales_invoice_widgets/bill_to_detail_widget.dart';
import 'widgets/add_new_sales_invoice_widgets/bill_to_widget.dart';
import 'widgets/add_new_sales_invoice_widgets/invoice_date_widget.dart';
import 'widgets/add_new_sales_invoice_widgets/invoice_number_widget.dart';

class AddNewInvoice extends ConsumerStatefulWidget {
  const AddNewInvoice({super.key});

  @override
  ConsumerState<AddNewInvoice> createState() => _AddNewInvoiceState();
}

class _AddNewInvoiceState extends ConsumerState<AddNewInvoice> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("object Build method");
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
            ReusableText(
              text: " Invoice Number",
              style: appStyle(18, FontWeight.w400, AppConst.kGreyLight),
            ),
            const HeightSpacer(height: 5),
            InvoiceNumberWidget(size: size),
            const HeightSpacer(height: 16),
            ReusableText(
              text: " Invoice Date",
              style: appStyle(18, FontWeight.w400, AppConst.kGreyLight),
            ),
            const HeightSpacer(height: 5),
            InvoiceDateWidget(size: size),
            const HeightSpacer(height: 16),
            ReusableText(
              text: " Bill To",
              style: appStyle(18, FontWeight.w400, AppConst.kGreyLight),
            ),
            HeightSpacer(height: 5),
            BillToWidget(size: size),
            BillToDetailWidget(),
          ],
        ),
      ),
    );
  }
}
