import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/utils/constants.dart';
import '../../../../../../common/widget/app_style.dart';
import '../../../../../../common/widget/height_spacer.dart';
import '../../../../../../common/widget/reusable_text.dart';
import '../../sales_provider/add_new_sales_invoice_provider.dart';
import 'add_row_btn.dart';
import 'loading_list_widget.dart';

class BillToDetailWidget extends ConsumerWidget {
  const BillToDetailWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        final selectedBillToId = ref.watch(selectedBillToProvider);
        final billToDetails = ref.watch(
          billToDetailsProvider(selectedBillToId),
        );

        if (selectedBillToId == "Select Bill To") {
          return SizedBox();
        }
        return billToDetails.when(
          data: (data) {
            String outstanding = data["bookkeeping"]["outstanding"] >= 0
                ? "₹${data["bookkeeping"]["outstanding"]} payment done in advance"
                : "${data["bookkeeping"]["outstanding"]} payment due";
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeightSpacer(height: 12),
                  data["bookkeeping"]["outstanding"] != 0
                      ? Column(
                          children: [
                            ReusableText(
                              text: outstanding,
                              style: appStyle(
                                18,
                                FontWeight.w400,
                                AppConst.kGreyLight,
                              ),
                            ),
                            HeightSpacer(height: 5),
                          ],
                        )
                      : SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ReusableText(
                        text: "Particulars",
                        style: appStyle(32, FontWeight.w700, AppConst.kBlack),
                      ),
                      AddRowBtn(onPressed: () {}),
                    ],
                  ),
                ],
              ),
            );
          },
          error: (error, st) {
            return const Text("error");
          },
          loading: () => const LoadingListWidget(),
        );
      },
    );
  }
}
