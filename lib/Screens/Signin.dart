import 'dart:convert';
import 'dart:io';

import 'package:anmor_garbh_sanskar/Screens/Homepage.dart';
import 'package:anmor_garbh_sanskar/Screens/constants/app_constants.dart';
import 'package:anmor_garbh_sanskar/Screens/singup.dart';
import 'package:anmor_garbh_sanskar/Widgets/circular.dart';
import 'package:anmor_garbh_sanskar/Widgets/text_field.dart';
import 'package:anmor_garbh_sanskar/constants/pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Widgets/text_button.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool isLoading = true;
  bool isShown = false;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Future _signIn() async {
    var data = <String, dynamic>{
      "username": _username.text,
      "password": _password.text,
    };
    final response = await http.post(Uri.parse('https://apis.bhavishashah.com/api/check-login'), body: data);
    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if(jsonData['message'] == "")
          {
             kSharedPreferences?.setBool('logged', true);
            kSharedPreferences?.setInt('id', jsonData['data']['id']);
            Navigator.push(context, CupertinoPageRoute(builder: (context) => const Homescreen()));
          }
        else
          {
            Fluttertoast.showToast(msg: jsonData['message']);
          }
        _username.clear();
        _password.clear();
        setState(() {
          isLoading = true;
        });
      }
    } on SocketException catch (_) {
      setState(() {
        isLoading = true;
      });
      Fluttertoast.showToast(msg: 'Internet Connection required');
    } catch (_) {
      setState(() {
        isLoading = true;
      });
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                  height: 0.2.sh,
                  width: 0.3.sw,
                  child:
                      const Image(image: AssetImage('assets/images/icon.png'))),
            ),
            Expanded(
              child: RotatedBox(
                quarterTurns: 2,
                child: ClipPath(
                  clipper: CustomShape(),
                  child: Container(
                    width: double.infinity,
                    height: 0.65.sh,
                    color: Palette.BackGroundColor,
                    child: RotatedBox(
                      quarterTurns: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                'Welcome to Anmol Garbh Sanskar',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Palette.textWhiteColor,
                                    fontSize: 20.sp,
                                    fontStyle: FontStyle.italic),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                               Input(
                                controller: _username,
                                inputDecoration: const InputDecoration(
                                  labelText: 'Email/Username',
                                  prefixIcon: Icon(
                                    FontAwesomeIcons.userLarge,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                               Input(
                                 controller: _password,
                                 obscureText: !isShown,
                                maxLines: 1,
                                textInputAction: TextInputAction.done,
                                inputDecoration:  InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: const Icon(
                                    FontAwesomeIcons.unlockKeyhole,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      !isShown ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                                      color: Colors.white,
                                    ),
                                    onPressed: (){
                                      setState(() {
                                        isShown = !isShown;
                                      });
                                    },
                                  ),

                                ),
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 37.w),
                                    child: Text(
                                      'Forget Password?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp,
                                          color: Colors.white),
                                    ),
                                  )),
                             isLoading ? SignInButton(
                                width: 0.80.sw,
                                maincolor: Colors.white,
                                text: 'LOGIN',
                                callback: (){
                                  if (_username.text.isEmpty) {
                                    Fluttertoast.showToast(msg: 'Username required');
                                    return;
                                  }
                                  if (_password.text.isEmpty) {
                                    Fluttertoast.showToast(msg: 'Password required');
                                    return;
                                  }
                                  setState(() {
                                    isLoading  = false;
                                  });
                                  _signIn();
                                  },
                              ) : const CircularIndicator(height: 0.60,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Dont have an account?',
                                    style: TextStyle(fontSize: 15.sp),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (_) => const SignUp())),
                                      child: Text(
                                        'Sing Up',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();

    path.lineTo(0, height);
    path.quadraticBezierTo(width * 0.5, height - 100, width, height);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
