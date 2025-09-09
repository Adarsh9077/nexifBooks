import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/utils/constants.dart';
import '../../../../../../common/widget/app_style.dart';
import '../../../../../../common/widget/reusable_text.dart';
import '../../sales_provider/add_new_sales_invoice_provider.dart';
import 'add_new_bill_to_loading_widget.dart';

class BillToWidget extends ConsumerWidget {
  const BillToWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        final invoiceBillToList = ref.watch(invoiceBillToProvider);
        final selectedValue = ref.watch(selectedBillToProvider);
        print("object Build Consumer Bill to");
        return invoiceBillToList.when(
          data: (data) => Container(
            width: size.width,
            height: 48,
            padding: EdgeInsets.only(left: 16, right: 12, top: 8, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppConst.kBlueLight, width: .5),
            ),
            child: DropdownButton(
              isExpanded: true,
              value: selectedValue,
              underline: SizedBox(height: 0),
              items: [
                const DropdownMenuItem<String>(
                  value: "Select Bill To",
                  child: Text("Select Bill To"),
                ),
                ...data.map((e) {
                  String name = e.name!;
                  String address = e.address!.isEmpty ? "" : "${e.address}, ";
                  String city = e.city!.isEmpty ? "" : "${e.city}, ";
                  String state = e.state!.isEmpty ? "" : "${e.state}, ";
                  String country = e.country!;
                  return DropdownMenuItem<String>(
                    value: e.id.toString(),
                    child: Text(
                      "$name - $address $city $state $country",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }),
              ],
              onChanged: (value) {
                print(value);
                ref.read(selectedBillToProvider.notifier).state = value!;
              },
            ),
          ),
          error: (error, stackTrace) {
            return ReusableText(
              text: "Error : $error",
              style: appStyle(26, FontWeight.normal, AppConst.kRed),
            );
          },
          // add Size variable
          loading: () => const AddNewBillToLoadingWidget(),
        );
      },
    );
  }
}
