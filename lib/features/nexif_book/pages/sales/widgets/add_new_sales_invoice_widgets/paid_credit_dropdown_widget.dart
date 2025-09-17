import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../../common/utils/constants.dart';
import '../../../../../../common/widget/app_style.dart';
import '../../../../../../common/widget/reusable_text.dart';
import '../../sales_provider/add_new_sales_invoice_provider.dart';

class PaidCreditDropdownWidget extends ConsumerWidget {
  const PaidCreditDropdownWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final paidCreditState = ref.watch(paidCreditDropDownProvider);
    return Container(
      width: size.width,
      height: 48,
      padding: EdgeInsets.only(left: 0, right: 12, top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppConst.kBlueLight, width: .5),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            value: paidCreditState.toString(),
            isExpanded: true,
            items: [
              DropdownMenuItem(
                value: "Paid",
                child: ReusableText(
                  text: "Paid",
                  style: appStyle(18, FontWeight.w400, AppConst.kBKDark),
                ),
              ),
              DropdownMenuItem(
                value: "Credit",
                child: ReusableText(
                  text: "Credit",
                  style: appStyle(18, FontWeight.w400, AppConst.kBKDark),
                ),
              ),
            ],
            onChanged: (value) {
              ref.read(paidCreditDropDownProvider.notifier).state = value
                  .toString();
              print(value);
            },
          ),
        ),
      ),
    );
  }
}
