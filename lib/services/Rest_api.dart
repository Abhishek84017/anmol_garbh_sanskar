import 'dart:convert';
import 'dart:io';

import 'package:anmor_garbh_sanskar/model/fiveqModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../model/menuModel.dart';
import '../model/dailyTaskmodel.dart';
import '../model/submenu_model.dart';


class RestApi{
  final List<MenuModel> _menus = <MenuModel>[];
  final List<SubMenuHomepageModel> _submenus = <SubMenuHomepageModel>[];
  final List<FiveQModel> _fiveQData = <FiveQModel>[];
  final List<DailyQTaskModel> _dailyQData = <DailyQTaskModel>[];


  Future<List<MenuModel>> fetchMenus() async {
    final response = await http.post(Uri.parse("https://apis.bhavishashah.com/api/get-menus"));
    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null) {
          jsonData['data'].forEach((v) {
            _menus.add(MenuModel.fromJson(v));
          });
        }
      }
    } on SocketException catch (error) {
      Fluttertoast.showToast(msg: 'No Internet Connection');
    } catch (e) {
      print('hello');
      Fluttertoast.showToast(msg: '$e');
    }
    return _menus;
  }

  Future<List<SubMenuHomepageModel>> fetchSubMenus(Map<String,String> data ) async {
    final response = await http.post(Uri.parse("https://apis.bhavishashah.com/api/get-menus"),body: data);
    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null) {
          jsonData['data'].forEach((v) {
            _submenus.add(SubMenuHomepageModel.fromJson(v));
          });
        }
      }
    } on SocketException catch (error) {
      Fluttertoast.showToast(msg: 'No Internet Connection');
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
    return _submenus;
  }


  Future<List<FiveQModel>> fetchFiveQTask(int id) async {
    final response = await http.get(Uri.parse("https://apis.bhavishashah.com/api/get-five-q-task/$id"));
    print(response.request);
    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null) {
          jsonData['data'].forEach((v) {
            _fiveQData.add(FiveQModel.fromJson(v));
          });
        }
      }
    } on SocketException catch (error) {
      Fluttertoast.showToast(msg: 'No Internet Connection');
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
    return _fiveQData;
  }

  Future<List<DailyQTaskModel>> fetchDailyQTask() async {
    final response = await http.get(Uri.parse("https://apis.bhavishashah.com/api/get-daily-task"));
    print(response.request);
    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null) {
          jsonData['data'].forEach((v) {
            _dailyQData.add(DailyQTaskModel.fromJson(v));
          });
        }
      }
    } on SocketException catch (error) {
      Fluttertoast.showToast(msg: 'No Internet Connection');
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
    return _dailyQData;
  }

}