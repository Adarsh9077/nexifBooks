import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/features/onboarding/pages/onboarding.dart';
import 'package:nexifbook/features/onboarding/pages/splash_routes.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) {
        return MaterialApp(
          title: "Nexif Book",
          theme: ThemeData(
            scaffoldBackgroundColor: AppConst.kBKDark,
            colorScheme: lightColorScheme ?? defaultLightColorScheme,
            useMaterial3: true,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          darkTheme: ThemeData(
            scaffoldBackgroundColor: AppConst.kBKDark,
            colorScheme: darkColorScheme ?? defaultDarkColorScheme,
            useMaterial3: true,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: SplashRoutes(),
        );
      },
    );
  }
}
