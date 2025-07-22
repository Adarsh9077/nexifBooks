import 'package:flutter/material.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';
import 'package:nexifbook/common/widget/width_spacer.dart';
import 'package:nexifbook/features/onboarding/widget/page_one.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kLight,
      body: Stack(
        children: [
          PageView(
            physics: AlwaysScrollableScrollPhysics(),
            controller: pageController,
            children: [PageOne(), PageOne()],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppConst.kBlueLight,
                          blurRadius: 20,
                          blurStyle: BlurStyle.normal,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        pageController.nextPage(
                          duration: Duration(milliseconds: 600),
                          curve: Curves.ease,
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.chevron_right,
                            size: 30,
                            color: AppConst.kLight,
                          ),
                          WidthSpacer(width: 0),
                          ReusableText(
                            text: "Skip",
                            style: appStyle(
                              16,
                              FontWeight.w600,
                              AppConst.kLight,
                            ),
                          ),
                          WidthSpacer(width: 8),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 600),
                        curve: Curves.ease,
                      );
                    },
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 2,
                      effect: WormEffect(
                        dotHeight: 12,
                        dotWidth: 16,
                        spacing: 10,
                        dotColor: AppConst.kBlueLight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
