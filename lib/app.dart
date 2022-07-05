import 'package:anmor_garbh_sanskar/Screens/splashscreen.dart';
import 'package:anmor_garbh_sanskar/constants/pallete.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Material nav key
  static GlobalKey<NavigatorState> materialNavKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              primarySwatch: Palette.primaryColor,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),

            ),
            home: const SplashScreen(),
          );
        });
  }
}
