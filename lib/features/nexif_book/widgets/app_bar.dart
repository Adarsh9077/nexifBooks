import 'package:flutter/material.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../auth/pages/login_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.isHomePage = false});

  final String title;
  final bool isHomePage;

  @override
  Widget build(BuildContext context) {
    void logOut(BuildContext context) async {
      final pref = await SharedPreferences.getInstance();
      await pref.setBool("is_logged_in", false);
      await pref.setString("access_key", "");
      await pref.setString("refresh_token", "");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }

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
        PopupMenuButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CircleAvatar(
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
          ),
          onSelected: (value) {
            print(value);
            if (value == 'Sign Out') {
              logOut(context);
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                value: 'Organization Profile',
                child: Text("Organization Profile"),
              ),
              PopupMenuItem(value: 'My Tickets', child: Text("My Tickets")),
              PopupMenuItem(
                value: 'Change Password',
                child: Text("Change Password"),
              ),
              PopupMenuItem(value: 'Sign Out', child: Text("Sign Out")),
            ];
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
