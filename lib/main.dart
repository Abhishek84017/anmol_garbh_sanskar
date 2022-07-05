import 'package:anmor_garbh_sanskar/Screens/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  kSharedPreferences = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

