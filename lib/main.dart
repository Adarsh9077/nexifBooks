import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/features/auth/pages/login_page.dart';
import 'package:nexifbook/features/onboarding/pages/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final defaultLightColorScheme = ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
  );

  static final defaultDarkColorScheme = ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return
      // ScreenUtilInit(
      // useInheritedMediaQuery: true,
      // designSize: const Size(375, 812), // Standard iPhone X size
      // minTextAdapt: true,
      // splitScreenMode: true, // Important for responsive design
      // builder: (context, child) =>
          DynamicColorBuilder(
        builder: (lightColorScheme, darkColorScheme) {
          return MaterialApp(
            title: "Nexif Book",
            theme: ThemeData(
              scaffoldBackgroundColor: AppConst.kBKDark,
              colorScheme: lightColorScheme ?? defaultLightColorScheme,
              useMaterial3: true, // Consistent Material 3 usage
              // Add platform-specific configurations
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: AppConst.kBKDark, // Consistent background
              colorScheme: darkColorScheme ?? defaultDarkColorScheme,
              useMaterial3: true,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            themeMode: ThemeMode.light, // Use system theme instead of forcing light
            debugShowCheckedModeBanner: false,
            home: const Onboarding(),
          );
        },
      );
    // );
  }
}