import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/widget/height_spacer.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';
import 'package:nexifbook/features/auth/services/auth_service.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/sales_provider/add_new_sales_invoice_provider.dart';
import 'package:nexifbook/features/nexif_book/widgets/app_bar.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:shimmer/shimmer.dart';
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
            Container(
              width: size.width,
              height: 48,
              padding: EdgeInsets.only(left: 16, right: 12, top: 8, bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppConst.kBlueLight, width: .5),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: FutureBuilder(
                  future: AuthService.getSalesNewInvoiceId(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade200,
                        highlightColor: Colors.grey.shade300,
                        child: Container(
                          height: 15,
                          width: 189,
                          color: Colors.grey.shade500,
                        ),
                      );
                    } else {
                      return ReusableText(
                        text: "${snapshot.data["next"]}",
                        style: appStyle(
                          18,
                          FontWeight.w600,
                          AppConst.kGreyLight,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            HeightSpacer(height: 16),
            ReusableText(
              text: " Invoice Date",
              style: appStyle(18, FontWeight.w400, AppConst.kGreyLight),
            ),
            HeightSpacer(height: 5),
            GestureDetector(
              onTap: () {
                DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime(2018, 3, 5),
                  maxTime: DateTime(2050, 12, 31),
                  onConfirm: (date) {
                    print('confirm ********\n$date');
                    ref.read(invoiceDateProvider.notifier).state = date
                        .toString()
                        .substring(0, 10);
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.en,
                );
              },
              child: Consumer(
                builder: (context, ref, child) {
                  final invoiceDate = ref.watch(invoiceDateProvider);
                  print("object Build Consumer");
                  return Container(
                    width: size.width,
                    height: 48,
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 12,
                      top: 8,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppConst.kBlueLight, width: .5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          text: invoiceDate.toString(),
                          style: appStyle(
                            18,
                            FontWeight.w600,
                            AppConst.kGreyLight,
                          ),
                        ),
                        Icon(
                          Icons.calendar_month_outlined,
                          color: AppConst.kBlueLight,
                          size: 28,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
