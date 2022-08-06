import 'dart:convert';

import 'dart:io';
import 'package:intl/intl.dart';
import 'package:anmor_garbh_sanskar/Screens/Signin.dart';
import 'package:anmor_garbh_sanskar/Widgets/text_field.dart';
import 'package:anmor_garbh_sanskar/constants/pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Widgets/circular.dart';
import '../Widgets/text_button.dart';
import 'package:http/http.dart' as http;

import '../model/reasonModel.dart';
import 'Homepage.dart';
import 'constants/app_constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController _userName = TextEditingController();
  final TextEditingController _userEmail = TextEditingController();
  final TextEditingController _userPassword = TextEditingController();
  final TextEditingController _userMobileNo = TextEditingController();
  final TextEditingController _lastMenstrualDateController = TextEditingController();
  bool isShown = false;
  bool isFetchedReason = false;
  bool _isLoaded = true;
   DateTime _selectedDate = DateTime.now();
  bool isShownDatePicker = false;

  int _reasonForJoining = 0;

  final List<ReasonModel> _reasons = <ReasonModel>[];

  Future<List<ReasonModel>> _fetchReasons() async {
    final response = await http.get(Uri.parse("https://apis.bhavishashah.com/api/get-reasons"));
    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null) {
          jsonData['data'].forEach((v) {
            _reasons.add(ReasonModel.fromJson(v));
          });
        }
        setState((){
          isFetchedReason = true;
        });
      }
    } on SocketException {
      Fluttertoast.showToast(msg: 'No Internet Connection');
    } catch (e) {
      print(e.toString());
    }
    return _reasons;
  }

  Future _signUp() async {
    var data = <String, dynamic>{
      'name': _userName.text,
      'username': _userEmail.text,
      'password': _userPassword.text,
      'mobile': _userMobileNo.text,
      'join_reason_id': _reasonForJoining.toString(),
      'last_menstrual_date': _selectedDate.toString()
    };
    print(data);
    final response = await http.post(Uri.parse('https://apis.bhavishashah.com/api/user-registration'), body: data);
    print(response.statusCode);
      try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if(jsonData['message'] == "Customer Registered Successfully")
        {
          await  kSharedPreferences?.setBool('logged', true);
          await kSharedPreferences?.setInt('id', jsonData['data']['id']);
           _userName.clear();
          _userEmail.clear();
          _userPassword.clear();
          _userMobileNo.clear();
          _lastMenstrualDateController.clear();
          Navigator.push(context, CupertinoPageRoute(builder: (context) => const Homescreen()));
        }
        else
        {
          Fluttertoast.showToast(msg: jsonData['message']);
        }
        setState(() {
          _isLoaded = true;
        });
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(msg: 'Internet Connection required');
    } catch (_) {
        setState(() {
          _isLoaded = true;
        });
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }

  Future lastMenstrualDate(BuildContext context) async {
    final DateTime? lastMenstrualDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (lastMenstrualDate != null) {
      _selectedDate = lastMenstrualDate;
      _lastMenstrualDateController.text = DateFormat('dd/MM/yyyy').format(_selectedDate) ;
      setState((){});
    }
  }

  @override
  void initState(){
    super.initState();
    _fetchReasons();
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
                        child: !isFetchedReason ? const  Center(child: CircularIndicator(height: 0.75,),) : SingleChildScrollView(
                          child: Column(
                            children: [
                              Input(
                                controller: _userName,
                                inputDecoration: const InputDecoration(
                                  labelText: 'Your Name',
                                  prefixIcon: Icon(
                                    FontAwesomeIcons.userLarge,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              Input(
                                controller: _userEmail,
                                inputDecoration: const InputDecoration(
                                  labelText: 'Email / Username',
                                  prefixIcon: Icon(
                                    FontAwesomeIcons.inbox,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              Input(
                                controller: _userPassword,
                                obscureText: !isShown,
                                maxLines: 1,
                                inputDecoration: InputDecoration(
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
                              Input(
                                controller: _userMobileNo,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                inputDecoration: const InputDecoration(
                                  labelText: 'Mobile Number',
                                  prefixIcon: Icon(
                                    FontAwesomeIcons.mobile,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              Container(
                                width: 0.80.sw,
                                height: 0.2.sh,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.w),
                                    border: Border.all(color: Colors.white, width: 3)),
                                child:  ListView.builder(
                                    itemCount: _reasons.length,
                                    itemBuilder: (context, index) {
                                      var item = _reasons[index];
                                      return RadioListTile<int?>(
                                        activeColor: Colors.red,
                                        title: Text(
                                          item.title.toString(),
                                          style: const TextStyle(
                                              color:
                                              Palette.textWhiteColor),
                                        ),
                                        value: item.id,
                                        groupValue: _reasonForJoining,
                                        onChanged: (int? value) {
                                          if(value == 1)
                                            {
                                              isShownDatePicker = true;
                                            }

                                          else{
                                            _lastMenstrualDateController.clear();
                                            isShownDatePicker = false;
                                          }
                                          _reasonForJoining = value!;
                                          setState(() {
                                          });
                                        },
                                      );
                                    }),
                              ),
                              isShownDatePicker ? Input(
                                onTap:  () => lastMenstrualDate(context),
                               readonly: true,
                                controller: _lastMenstrualDateController,
                               inputDecoration: const InputDecoration(
                                  labelText: 'Last  Menstrual Date',
                                  suffixIcon: Icon(
                                    FontAwesomeIcons.calendar,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ) : const SizedBox.shrink(),
                              SizedBox(
                                height: 10.w,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: FittedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'By Signing up you agree to our',
                                        style: TextStyle(fontSize: 17.sp),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      GestureDetector(
                                          onTap: () => Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (_) =>
                                                  const SignIn())),
                                          child: Text(
                                            'Tearms of Service',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 21.sp,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              !_isLoaded ? const CircularIndicator(height: 0.75,)  : SignInButton(
                                width: 0.80.sw,
                                maincolor: Colors.white,
                                text: 'SIGNUP',
                                callback: (){
                                  if (_userName.text.isEmpty) {
                                    Fluttertoast.showToast(msg: 'Enter UserName');
                                    return;
                                  }
                                  if (_userEmail.text.isEmpty) {
                                    Fluttertoast.showToast(msg: 'Enter Email');
                                    return;
                                  }
                                  if (_userPassword.text.isEmpty) {
                                    Fluttertoast.showToast(msg: 'Enter Password');
                                    return;
                                  }
                                  if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(_userEmail.text)) {
                                    Fluttertoast.showToast(
                                        msg: 'please enter valid email');
                                  }
                                  if (!RegExp(r"^(?:[+0]9)?[0-9]{10}$")
                                      .hasMatch(_userMobileNo.text)) {
                                    Fluttertoast.showToast(
                                        msg: 'please enter valid MobileNo');
                                    return;
                                  }
                                  if(_reasonForJoining == '')
                                    {
                                      Fluttertoast.showToast(msg: 'Please Select Reason');
                                      return;
                                    }
                                                              _signUp();
                                  setState((){
                                    _isLoaded = false;
                                  });
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Already have an account?',
                                      style: TextStyle(fontSize: 15.sp),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (_) =>
                                                const SignIn())),
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                ),
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
