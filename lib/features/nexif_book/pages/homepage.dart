import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';

// import 'package:nexifbook/common/widget/custom_otl_btn.dart';
import 'package:nexifbook/common/widget/height_spacer.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';
import 'package:nexifbook/features/auth/services/auth_service.dart';

// import 'package:nexifbook/features/nexif_book/pages/json_display_page.dart';
import 'package:nexifbook/features/nexif_book/widgets/app_bar.dart';
import 'package:nexifbook/features/nexif_book/widgets/custom_drawer.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends ConsumerState<HomePage> {
  Map<String, dynamic>? userData;
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchUserData();
    _startLoadingTimer();
  }

  void _startLoadingTimer() async {
    fetchUserData();
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> fetchUserData() async {
    final user = await AuthService.getUserDetails();
    userData = user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Dashboard", isHomePage: true),
      drawer: CustomDrawer(),
      drawerEdgeDragWidth: 50,
      backgroundColor: AppConst.kLight,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ReusableText(
                    text: "Hi, ",
                    style: appStyle(32, FontWeight.bold, AppConst.kBlueLight),
                  ),
                  HeightSpacer(height: 10),
                  FutureBuilder(
                    future: fetchUserData(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return ReusableText(
                          text: "${userData!["full_name"]}",
                          style: appStyle(
                            32,
                            FontWeight.bold,
                            AppConst.kBlueLight,
                          ),
                        );
                      }
                      return Text("${userData!["id"]}");
                    },
                  ),
                  // CustomOtlBtn(
                  //   width: AppConst.kWidth * 0.9,
                  //   height: 52,
                  //   color: AppConst.kBlueLight,
                  //   text: "Json Data",
                  //   iconData: false,
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => JsonDisplayPage(),
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
      ),
    );
  }
}
