import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/custom_otl_btn.dart';
import 'package:nexifbook/common/widget/height_spacer.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';

class CustomTableBarChart extends ConsumerWidget {
  const CustomTableBarChart({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: AppConst.kLight,
        border: Border.all(color: AppConst.kGreyLight, width: .5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(
                  text: "Top SKUs Purchased",
                  style: appStyle(18, FontWeight.bold, AppConst.kBlack),
                ),
                GestureDetector(
                  child: Icon(Icons.list_rounded, size: 28),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      // sheetAnimationStyle: _animationStyle,
                      scrollControlDisabledMaxHeightRatio: .25,
                      builder: (BuildContext context) {
                        return SizedBox.expand(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 30,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomOtlBtn(
                                      width: AppConst.kWidth * 0.5,
                                      height: 52,
                                      color: AppConst.kBlueLight,
                                      text: "Qty",
                                      iconData: false,
                                    ),
                                    CustomOtlBtn(
                                      width: AppConst.kWidth * 0.5,
                                      height: 52,
                                      color: AppConst.kBlueLight,
                                      text: "Amount",
                                      iconData: false,
                                    ),
                                  ],
                                ),
                                HeightSpacer(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomOtlBtn(
                                      width: AppConst.kWidth * 0.5,
                                      height: 52,
                                      color: AppConst.kBlueLight,
                                      text: "Table",
                                      iconData: false,
                                    ),
                                    CustomOtlBtn(
                                      width: AppConst.kWidth * 0.5,
                                      height: 52,
                                      color: AppConst.kBlueLight,
                                      text: "Bar",
                                      iconData: false,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
