import 'package:flutter/material.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';

class CustomOtlBtn extends StatelessWidget {
  const CustomOtlBtn({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.text,
    required this.iconData,
    this.iconWidget,
    this.color2,
    this.onTap,
  });

  final double width;
  final double height;
  final Color color;
  final String text;
  final bool iconData;
  final Color? color2;
  final Widget? iconWidget;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color2,
          border: Border.all(color: color, width: 1),
          borderRadius: BorderRadius.circular(AppConst.kRadius),
        ),
        child: Center(
          child: Row(
            children: <Widget>[
              if (iconData) iconWidget!,
              ReusableText(
                text: text,
                style: appStyle(18, FontWeight.bold, color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
