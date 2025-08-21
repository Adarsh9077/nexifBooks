import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';

class CustomTabBar extends ConsumerWidget {
  const CustomTabBar({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size screenSize = MediaQuery.of(context).size;
    return TabBar(
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
        color: Color(0XFF1677FF),
        borderRadius: BorderRadius.circular(AppConst.kRadius * 0.75),
      ),
      indicatorColor: Color(0X1A007bff),
      labelPadding: EdgeInsets.zero,
      isScrollable: false,
      labelColor: AppConst.kLight,
      labelStyle: appStyle(24, FontWeight.w600, AppConst.kBlueLight),
      controller: tabController,
      unselectedLabelColor: Color(0XFF1677FF),
      dividerColor: Colors.transparent,
      tabs: [
        Tab(
          child: Container(
            width: screenSize.width * 0.55,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(child: Text("Invoices")),
          ),
        ),
        Tab(
          child: Container(
            width: screenSize.width * 0.55,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(child: Text("Items")),
          ),
        ),
      ],
    );
  }
}
