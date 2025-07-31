import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/custom_otl_btn.dart';
import 'package:nexifbook/common/widget/height_spacer.dart';
import '../dashboard_controller/dashboard_controller.dart';

class BottomSheetFilter extends ConsumerWidget {
  const BottomSheetFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Consumer(
              builder: (context, ref, child) {
                bool qtyBtnState = ref.watch(qtyProvider);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomOtlBtn(
                      width: AppConst.kWidth * 0.5,
                      height: 52,
                      color: qtyBtnState
                          ? AppConst.kLight
                          : AppConst.kBlueLight,
                      text: "Qty",
                      iconData: false,
                      color2: qtyBtnState
                          ? AppConst.kBlueLight
                          : AppConst.kLight,
                      onTap: () {
                        if (!qtyBtnState) {
                          ref.read(qtyProvider.notifier).toggle();
                        }
                      },
                    ),
                    CustomOtlBtn(
                      width: AppConst.kWidth * 0.5,
                      height: 52,
                      color: qtyBtnState
                          ? AppConst.kBlueLight
                          : AppConst.kLight,
                      color2: qtyBtnState
                          ? AppConst.kLight
                          : AppConst.kBlueLight,
                      text: "Amount",
                      iconData: false,
                      onTap: () {
                        if (qtyBtnState) {
                          ref.read(qtyProvider.notifier).toggle();
                        }
                      },
                    ),
                  ],
                );
              },
            ),
            HeightSpacer(height: 20),
            Consumer(
              builder: (context, ref, child) {
                bool tableBtnState = ref.watch(tableProvider);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomOtlBtn(
                      width: AppConst.kWidth * 0.5,
                      height: 52,
                      color: tableBtnState
                          ? AppConst.kLight
                          : AppConst.kBlueLight,
                      color2: tableBtnState
                          ? AppConst.kBlueLight
                          : AppConst.kLight,
                      text: "Table",
                      iconData: false,
                      onTap: () {
                        if (!tableBtnState) {
                          ref.read(tableProvider.notifier).toggle();
                        }
                      },
                    ),
                    CustomOtlBtn(
                      width: AppConst.kWidth * 0.5,
                      height: 52,
                      color: tableBtnState? AppConst.kBlueLight : AppConst.kLight,
                      color2: tableBtnState? AppConst.kLight : AppConst.kBlueLight,
                      text: "Bar",
                      iconData: false,
                      onTap: () {
                        if (tableBtnState) {
                          ref.read(tableProvider.notifier).toggle();
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
