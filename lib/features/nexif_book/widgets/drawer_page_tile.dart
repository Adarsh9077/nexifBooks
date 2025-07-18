import 'package:flutter/material.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/height_spacer.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';
import 'package:nexifbook/common/widget/width_spacer.dart';

class DrawerPageTile extends StatelessWidget {
  final String pageTitle;
  final String pageDescription;
  final IconData leadingIcon;
  final Function onTap;

  const DrawerPageTile({
    super.key,
    required this.pageTitle,
    required this.pageDescription,
    required this.leadingIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            WidthSpacer(width: 15),
            Icon(leadingIcon, color: AppConst.kGreyLight),
            WidthSpacer(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    text: pageTitle,
                    style: appStyle(
                      AppConst.kFontSize,
                      FontWeight.w600,
                      AppConst.kBlueLight,
                    ),
                  ),
                  HeightSpacer(height: 1),
                  ReusableText(
                    text: pageDescription,
                    style: appStyle(16, FontWeight.normal, AppConst.kGreyLight),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16),
            WidthSpacer(width: 25),
          ],
        ),
      ),
    );
  }
}
