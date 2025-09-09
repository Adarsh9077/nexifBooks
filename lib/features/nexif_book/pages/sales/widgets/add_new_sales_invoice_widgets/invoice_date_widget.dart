import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/utils/constants.dart';
import '../../../../../../common/widget/app_style.dart';
import '../../../../../../common/widget/reusable_text.dart';
import '../../sales_provider/add_new_sales_invoice_provider.dart';

class InvoiceDateWidget extends ConsumerWidget {
  const InvoiceDateWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
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
            padding: EdgeInsets.only(left: 16, right: 12, top: 8, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppConst.kBlueLight, width: .5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(
                  text: invoiceDate.toString(),
                  style: appStyle(18, FontWeight.w600, AppConst.kGreyLight),
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
    );
  }
}
