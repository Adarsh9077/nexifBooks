import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/custom_otl_btn.dart';
import 'package:nexifbook/common/widget/custom_text_field.dart';
import 'package:nexifbook/common/widget/height_spacer.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';
import 'package:nexifbook/features/auth/controller/auth_controller.dart';
import 'package:nexifbook/features/nexif_book/pages/homepage.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final authController = ref.read(authControllerProvider.notifier);
    return Scaffold(
      backgroundColor: AppConst.kLight,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConst.kPadding * 1.25),
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
              Center(
                child: ReusableText(
                  text: "Please enter your Email Id and Password",
                  style: appStyle(16, FontWeight.w500, AppConst.kBlueLight),
                ),
              ),
              HeightSpacer(height: 10),
              CustomTextField(
                controller: emailController,
                hintText: "Email Id",
                suffixIcon: Icon(
                  Icons.mail_outline_rounded,
                  color: AppConst.kGreyDk,
                ),
                hintStyle: appStyle(
                  AppConst.kFontSize,
                  FontWeight.w500,
                  AppConst.kGreyDk,
                ),
              ),
              HeightSpacer(height: 20),
              CustomTextField(
                controller: passwordController,
                hintText: "Password",
                hintStyle: appStyle(
                  AppConst.kFontSize,
                  FontWeight.w500,
                  AppConst.kGreyDk,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    // print("$showPassword before setState");
                    setState(() {
                      showPassword = !showPassword;
                    });
                    // print("$showPassword after setState");
                  },
                  child: Icon(
                    Icons.remove_red_eye_outlined,
                    color: AppConst.kGreyDk,
                  ),
                ),
                obscureText: !showPassword,
              ),
              HeightSpacer(height: 20),
              if (authState.isLoading)
                Center(child: SizedBox(child: CircularProgressIndicator()))
              else
                CustomOtlBtn(
                  width: AppConst.kWidth * 0.9,
                  height: 52,
                  color: AppConst.kBlueLight,
                  color2: AppConst.kLight,
                  text: "Login",
                  iconData: false,
                  onTap: () async {
                    final success = await authController.login(
                      emailController.text,
                      passwordController.text,
                    );
                    if (success) {
                      if (!mounted) return;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Login failed. Please check your credentials.",
                            style: appStyle(16, FontWeight.bold, AppConst.kRed),
                          ),
                        ),
                      );
                    }
                  },
                ),
              TextButton(
                onPressed: () {},
                child: ReusableText(
                  text: "Forgot Password?",
                  style: appStyle(
                    AppConst.kFontSize,
                    FontWeight.normal,
                    AppConst.kBlueLight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
