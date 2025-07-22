import 'package:flutter/material.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/custom_otl_btn.dart';
import 'package:nexifbook/common/widget/height_spacer.dart';
import 'package:nexifbook/features/auth/pages/login_page.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConst.kWidth,
      height: AppConst.kHeight,
      color: AppConst.kLight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 00),
            child: Image.asset("assets/images/e_invoice.png"),
          ),
          HeightSpacer(height: 60),

          CustomOtlBtn(
            width: AppConst.kWidth * 0.9,
            height: 52,
            color: AppConst.kBlueLight,
            text: "Login with Email and Password",
            iconData: false,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          HeightSpacer(height: 90),
        ],
      ),
    );
  }
}
