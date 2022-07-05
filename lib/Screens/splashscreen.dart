import 'dart:async';

import 'package:anmor_garbh_sanskar/Screens/Homepage.dart';
import 'package:anmor_garbh_sanskar/Screens/Signin.dart';
import 'package:anmor_garbh_sanskar/Screens/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool loggedIn = false;

  @override
  void initState() {
    print(loggedIn);
    super.initState();
    getValidationData().whenComplete(() =>
        Timer(
            const Duration(seconds: 1),
                () =>
                Navigator.pushReplacement(context,
                    CupertinoPageRoute(builder: (context) => loggedIn == false ? const SignIn() : const Homescreen()))));
  }

  Future getValidationData() async {
    loggedIn = kSharedPreferences?.getBool('logged') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/back.png'), fit: BoxFit.fill),
          ),
        ),
        const Center(child: Image(image: AssetImage('assets/images/icon.png'))),
      ],
    );
  }
}
