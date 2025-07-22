import 'package:flutter/material.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/height_spacer.dart';
import 'package:nexifbook/features/onboarding/widget/page_two_tile.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

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
          HeightSpacer(height: 10),
          Text(
            "Why Businesses Choose NexifBooks",
            textAlign: TextAlign.center,
            style: appStyle(35, FontWeight.bold, AppConst.kBlueLight),
          ),
          HeightSpacer(height: 10),
          Column(
            spacing: 16,
            children: [
              PageTwoTile(
                icon: Icons.check_circle_outline,
                iconColor: AppConst.kGreen,
                title: "Quick & Easy Invoicing",
                subTitle: "Create and send GST-compliant\ninvoices in seconds.",
              ),
              PageTwoTile(
                icon: Icons.flash_on_outlined,
                iconColor: Colors.orangeAccent,
                title: "Automated Workflows",
                subTitle: "Automate reminders and recurring\nbilling tasks effortlessly.",
              ),
              PageTwoTile(
                icon: Icons.lock_outline,
                iconColor: AppConst.kBlueLight,
                title: "Secure & Reliable",
                subTitle: "Industry-standard encryption keeps\nyour data safe and private.",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
