import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';

class ExpansionTileCustom extends StatelessWidget {
  final String title;
  final Widget leading;
  final List<Widget> children;

  const ExpansionTileCustom({
    super.key,
    required this.title,
    required this.leading,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConst.kRadius),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: AppConst.kBlueLight),
            child: ExpansionTile(
              leading: leading,
              title: ReusableText(
                text: title,
                style: appStyle(
                  AppConst.kFontSize,
                  FontWeight.bold,
                  AppConst.kBKDark,
                ),
              ),
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
