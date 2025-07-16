import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/height_spacer.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kLight,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConst.kPadding),
          child: ListView(
            children: [
              HeightSpacer(height: 80),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Image.asset(
                  "assets/images/e_invoice.png",
                  height: 350,
                  width: 320,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
