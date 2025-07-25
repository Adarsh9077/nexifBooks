import 'package:flutter/material.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.isHomePage = false});

  final String title;
  final bool isHomePage;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: isHomePage
          ? Image.asset("assets/logo/nexif_logo.png", width: 55)
          : ReusableText(
              text: title,
              style: appStyle(
                AppConst.kFontSize * 1.25,
                FontWeight.bold,
                AppConst.kBKDark,
              ),
            ),
      centerTitle: isHomePage,
      elevation: 5,
      leading: isHomePage
          ? Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: Icon(Icons.menu, color: AppConst.kBKDark, size: 25),
                );
              },
            )
          : IconButton(
              padding: EdgeInsets.symmetric(horizontal: 32),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppConst.kBlack,
                size: 22,
              ),
            ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            // width: 80,
            padding: EdgeInsets.symmetric(horizontal: AppConst.kPadding),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(AppConst.kRadius * 0.5),
              // border: Border.all(width: .5, color: AppConst.kBlueLight),
            ),
            child: Row(
              children: [
                // Image.network(
                //   "src",
                //   width: 35,
                //   height: 35,
                //   fit: BoxFit.cover,
                //   errorBuilder: (_, __, ___) => Placeholder(),
                // ),
                CircleAvatar(
                  radius: AppConst.kRadius * 1.625,
                  backgroundColor: AppConst.kBlueLight,

                  child: ReusableText(
                    text: "AK",
                    style: appStyle(
                      AppConst.kFontSize * 0.875,
                      FontWeight.w600,
                      AppConst.kLight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
