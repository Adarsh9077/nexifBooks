import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/height_spacer.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';
import 'package:nexifbook/features/nexif_book/widgets/app_bar.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: CustomAppBar(title: "Dashboard", isHomePage: true),
      drawer: Drawer(backgroundColor: AppConst.kLight, child: Placeholder()),
      drawerEdgeDragWidth: 50,
      backgroundColor: AppConst.kLight,
      body: Column(
        children: [
          HeightSpacer(height: 260),
          Center(
            child: ReusableText(
              text: "Home Screen",
              style: appStyle(45, FontWeight.bold, AppConst.kBlueLight),
            ),
          ),
        ],
      ),
    );
  }
}
