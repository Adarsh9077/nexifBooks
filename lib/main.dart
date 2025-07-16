import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/features/auth/pages/login_page.dart';

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
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: Size(375, 820),
      minTextAdapt: true,
      builder: (context, child) => DynamicColorBuilder(
        builder: (lightColorScheme, darkColorScheme) {
          return MaterialApp(
            title: "Nexif Book",
            theme: ThemeData(
              scaffoldBackgroundColor: AppConst.kBKDark,
              colorScheme: lightColorScheme ?? defaultLightColorScheme,
            ),
            darkTheme: ThemeData(
              colorScheme: darkColorScheme ?? defaultDarkColorScheme,
              useMaterial3: true,
            ),
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: LoginPage(),
          );
        },
      ),
    );
  }
}
