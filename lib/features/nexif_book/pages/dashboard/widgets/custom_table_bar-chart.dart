import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';
import '../dashboard_controller/dashboard_controller.dart';
import 'bottom_sheet_filter.dart';
import 'custom_table.dart';

class CustomTableBarChart extends ConsumerWidget {
  final String title;

  const CustomTableBarChart({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  text: title,
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
                        return BottomSheetFilter();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Text("data", style: TextStyle(fontSize: 32)),
          Container(),
          Consumer(
            builder: (context, ref, child) {
              bool tableBtnState = ref.watch(tableProvider);
              return Container(
                child: tableBtnState
                    ? CustomTable()
                    : Text("Bars", style: TextStyle(fontSize: 32)),
              );
            },
          ),
        ],
      ),
    );
  }
}
