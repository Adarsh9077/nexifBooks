import 'package:flutter/material.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';

class TitleValueRow extends StatelessWidget {
  const TitleValueRow({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ReusableText(
            text: title,
            style: appStyle(20, FontWeight.w700, AppConst.kBlack),
          ),
          ReusableText(
            text: value,
            style: appStyle(18, FontWeight.normal, AppConst.kBKDark),
          ),
        ],
      ),
    );
  }
}
