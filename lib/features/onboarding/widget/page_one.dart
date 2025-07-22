import 'package:flutter/material.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/height_spacer.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConst.kHeight,
      width: AppConst.kWidth,
      color: AppConst.kLight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 00),
            child: Image.asset("assets/images/e_invoice.png"),
          ),
          HeightSpacer(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hey there,\nWelcome to NexifBooks!",
                style: appStyle(35, FontWeight.bold, AppConst.kBlueLight),
                textAlign: TextAlign.center,
              ),
              HeightSpacer(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: ReusableText(
                  text: "Cheers to easy business management!!",
                  style: appStyle(20, FontWeight.normal, AppConst.kGreyLight),
                ),
              ),
              HeightSpacer(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: ReusableText(
                  text: "Log in and pick up right where you left off.",
                  style: appStyle(20, FontWeight.normal, AppConst.kGreyLight),
                ),
              ),
            ],
          ),
          HeightSpacer(height: 60),
        ],
      ),
    );
  }
}
