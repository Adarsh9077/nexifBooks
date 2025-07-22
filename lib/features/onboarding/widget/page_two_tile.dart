import 'package:flutter/material.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/height_spacer.dart';
import 'package:nexifbook/common/widget/width_spacer.dart';

class PageTwoTile extends StatelessWidget {
  const PageTwoTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subTitle,
  });

  final IconData icon;
  final Color? iconColor;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: AppConst.kWidth,
      padding: EdgeInsets.symmetric(
        horizontal: AppConst.kPadding,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConst.kRadius),
        border: Border.all(color: AppConst.kBlueLight),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 30),
          WidthSpacer(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: appStyle(20, FontWeight.bold, AppConst.kBKDark),
              ),
              HeightSpacer(height: 5),
              Text(
                subTitle,
                style: appStyle(16, FontWeight.normal, AppConst.kGreyLight),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
