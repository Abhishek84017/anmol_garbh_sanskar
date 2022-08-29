import 'package:anmor_garbh_sanskar/Screens/splashscreen.dart';
import 'package:anmor_garbh_sanskar/constants/pallete.dart';
import 'package:anmor_garbh_sanskar/l10n/l10n.dart';
import 'package:anmor_garbh_sanskar/provider/languageprovider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Material nav key
  static GlobalKey<NavigatorState> materialNavKey = GlobalKey<NavigatorState>();

  static const String _appName = 'Anmol Garbh Sanskar';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ChangeLanguageProvider(),
      builder: (context,child)
      {
        final provider = Provider.of<ChangeLanguageProvider>(context);
          return  ScreenUtilInit(
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: _appName,
                  // You can use the library anywhere in the app even in theme
                  theme: ThemeData(
                    primarySwatch: Palette.primaryColor,
                    textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),

                  ),
                  home: const SplashScreen(),
                  locale: provider.local,
                  supportedLocales: L10n.all,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],

                );
              },);
      },

    );
  }
}
