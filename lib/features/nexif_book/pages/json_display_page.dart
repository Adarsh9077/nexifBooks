import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/height_spacer.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';
import 'package:nexifbook/features/auth/services/auth_service.dart';
import 'package:nexifbook/features/nexif_book/widgets/app_bar.dart';

class JsonDisplayPage extends StatefulWidget {
  const JsonDisplayPage({super.key});

  @override
  State<JsonDisplayPage> createState() => _JsonDisplayPageState();
}

class _JsonDisplayPageState extends State<JsonDisplayPage> {
  Map<String, dynamic>? userData;
  Map<String, dynamic>? companyData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    print("object123");
    final user = await AuthService.getUserDetails();
    final company = await AuthService.getCompanyDetails();
    userData = user;
    companyData = company;
    print("user Data");
    print(JsonEncoder.withIndent("-> ").convert(userData));
    print("Company data");
    print(JsonEncoder.withIndent("-> ").convert(companyData));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Json Data", isHomePage: false),
      backgroundColor: AppConst.kLight,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "👤 User JSON",
                style: appStyle(22, FontWeight.bold, AppConst.kBKDark),
              ),
              HeightSpacer(height: 20),
              Text(
                JsonEncoder.withIndent("-> ").convert(userData),
                style: appStyle(18, FontWeight.normal, AppConst.kGreyLight),
              ),
              HeightSpacer(height: 20),
              ReusableText(
                text: "🏢 Company JSON",
                style: appStyle(22, FontWeight.bold, AppConst.kBlueLight),
              ),
              HeightSpacer(height: 20),
              Text(
                const JsonEncoder.withIndent(" ").convert(companyData),
                style: appStyle(18, FontWeight.normal, AppConst.kGreyLight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
