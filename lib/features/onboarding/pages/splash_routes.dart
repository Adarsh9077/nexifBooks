import 'package:flutter/material.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/features/nexif_book/pages/homepage.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/add_new_invoice.dart';
import 'package:nexifbook/features/onboarding/pages/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashRoutes extends StatelessWidget {
  const SplashRoutes({super.key});

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("is_logged_in") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isLoggedIn(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: AppConst.kLight,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/logo/nexif_logo.png"),
                CircularProgressIndicator(),
              ],
            ),
          );
        }
        final loggedIn = snapshot.data!;
        // return loggedIn ? const HomePage() : const Onboarding();
        return loggedIn ? AddNewInvoice() : const Onboarding();

      },
    );
  }
}
