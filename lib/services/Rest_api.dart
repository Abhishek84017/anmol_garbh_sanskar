import 'dart:convert';
import 'dart:io';
import 'package:anmor_garbh_sanskar/model/fiveqModel.dart';
import 'package:anmor_garbh_sanskar/model/getLanguageModel.dart';
import 'package:anmor_garbh_sanskar/model/groupTaskModel.dart';
import 'package:anmor_garbh_sanskar/model/rechivechatModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../model/menuModel.dart';
import '../constants/urls.dart';
import '../model/dailyTaskmodel.dart';
import '../model/submenu_model.dart';

class RestApi {
  final List<MenuModel> _menus = <MenuModel>[];
  final List<SubMenuHomepageModel> _submenus = <SubMenuHomepageModel>[];
  final List<FiveQModel> _fiveQData = <FiveQModel>[];
  final List<DailyQTaskModel> _dailyQData = <DailyQTaskModel>[];
  final List<ReceiveChatModel> _chatMessages = <ReceiveChatModel>[];
  List<ReceiveChatModel> _chatMessages2 = <ReceiveChatModel>[];
  final List<GetLanguageDataModel> _getLanguage = <GetLanguageDataModel>[];
  final List<GroupTaskModel> _groupTaskData= <GroupTaskModel>[];

  Future<List<MenuModel>> fetchMenus() async {
    final response = await http
        .post(Uri.parse("https://apis.bhavishashah.com/api/get-menus"));
    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null) {
          jsonData['data'].forEach((v) {
            _menus.add(MenuModel.fromJson(v));
          });
        }
      }
    } on SocketException {
      Fluttertoast.showToast(msg: 'No Internet Connection');
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
    return _menus;
  }

  Future<List<SubMenuHomepageModel>> fetchSubMenus(
      Map<String, String> data) async {
    final response = await http.post(
        Uri.parse("https://apis.bhavishashah.com/api/get-menus"),
        body: data);
    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null) {
          jsonData['data'].forEach((v) {
            _submenus.add(SubMenuHomepageModel.fromJson(v));
          });
        }
      }
    } on SocketException {
      Fluttertoast.showToast(msg: 'No Internet Connection');
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
    return _submenus;
  }

  Future<List<FiveQModel>> fetchFiveQTask(int id) async {
    final response = await http.get(
        Uri.parse("https://apis.bhavishashah.com/api/get-five-q-task/$id"));
    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null) {
          jsonData['data'].forEach((v) {
            _fiveQData.add(FiveQModel.fromJson(v));
          });
        }
      }
    } on SocketException {
      Fluttertoast.showToast(msg: 'No Internet Connection');
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
    return _fiveQData;
  }

  Future<List<DailyQTaskModel>> fetchDailyQTask(int id) async {
    final response = await http
        .get(Uri.parse("https://apis.bhavishashah.com/api/get-daily-task/$id"));
    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null) {
          jsonData['data'].forEach((v) {
            _dailyQData.add(DailyQTaskModel.fromJson(v));
          });
        }
      }
    } on SocketException {
      Fluttertoast.showToast(msg: 'No Internet Connection');
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
    return _dailyQData;
  }

  static Future sendTask(Map<String, String> data) async {
    final response = await http.post(Uri.parse(Urls.sendTaskId), body: data);
    print(response.statusCode);
    try {
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: 'Status Saved');
      }
    } on SocketException {
      Fluttertoast.showToast(msg: 'No Internet Connection');
    } catch (e) {
      print('hello');
      Fluttertoast.showToast(msg: '$e');
    }
  }

  static Future sendMessage(Map<String, String> data) async {
    print(data);
    final response =
        await http.post(Uri.parse(Urls.sendChatMessage), body: data);
    print(response.statusCode);
  }

  Future<List<ReceiveChatModel>> fetchChatMessages(int id) async {
    final response =
        await http.get(Uri.parse('${Urls.receiveChatMessage}/$id'));

    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null) {
          jsonData['data'].forEach((v) {
            _chatMessages.add(ReceiveChatModel.fromJson(v));
          });
          _chatMessages2 = _chatMessages.reversed.toList();
        }
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(msg: 'No Internet Connection');
    } catch (e) {
      print('hello');
      Fluttertoast.showToast(msg: '$e');
    }
    return _chatMessages2;
  }

  static Future paymentSuccess(Map<String, String> payload) async {
    final response =
        await http.post(Uri.parse(Urls.successPaymentApiUrl), body: payload);
    try {
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: 'Plan Purchase Successfully');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<List<Map<String, dynamic>>?> fetchMeals(int id) async {
    final response = await http
        .get(Uri.parse('https://apis.bhavishashah.com/api/get-today-meal/$id'));
    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null) {
          return List<Map<String, dynamic>>.from(
              jsonData['data'].map((e) => e as Map<String, dynamic>));
        }
      }
    } on SocketException catch (_) {
      return null;
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  Future<List<GetLanguageDataModel>> getLanguage() async {
    final response = await http.get(
      Uri.parse('https://apis.bhavishashah.com/api/get-language'),
    );
    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null) {
          jsonData['data'].forEach((v) {
            _getLanguage.add(GetLanguageDataModel.fromJson(v));
          });
        }
      }
    } on SocketException {
      Fluttertoast.showToast(msg: 'No Internet Connection');
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
    return _getLanguage;
  }

  Future<List<GroupTaskModel>> fetchGroupTask(
      Map<String, String> data) async {
    final response = await http.post(
        Uri.parse("https://apis.bhavishashah.com/api/get-group-task"),
        body: data);
    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null) {
          jsonData['data'].forEach((v) {
            _groupTaskData.add(GroupTaskModel.fromJson(v));
          });
        }
      }
    } on SocketException {
      Fluttertoast.showToast(msg: 'No Internet Connection');
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
    return _groupTaskData;
  }

 static  Future updateLanguage(Map<String, String> data) async {
    final response = await http.post(
        Uri.parse("https://apis.bhavishashah.com/api/update-language"),
        body: data);
    try {
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: 'Updated Language');
      }
    } on SocketException {
      Fluttertoast.showToast(msg: 'No Internet Connection');
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
  }
}
