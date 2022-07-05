import 'dart:convert';
import 'dart:io';
import 'package:anmor_garbh_sanskar/Widgets/circular.dart';
import 'package:anmor_garbh_sanskar/constants/pallete.dart';
import 'package:anmor_garbh_sanskar/model/planModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class BecomePremiumPage extends StatefulWidget {
  const BecomePremiumPage({Key? key}) : super(key: key);

  @override
  State<BecomePremiumPage> createState() => _BecomePremiumPageState();
}

class _BecomePremiumPageState extends State<BecomePremiumPage> {

  final List<PlanModel> _plans = <PlanModel>[];

  Future<List<PlanModel>> _fetchPlans() async {
    _plans.clear();
    final response = await http.get(Uri.parse("https://apis.bhavishashah.com/api/get-plans"));
    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null) {
          jsonData['data'].forEach((v) {
            _plans.add(PlanModel.fromJson(v));
          });
        }
      }
    } on SocketException catch (error) {
      Fluttertoast.showToast(msg: 'No Internet Connection');
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
    return _plans;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Become Premium'),
      ),
      body: FutureBuilder(builder: (context, snapshot) {
        if (snapshot.hasData) {
         return ListView.builder(
              shrinkWrap: true,
              itemCount: _plans.length,
              itemBuilder: (context, index) {
                var item = _plans[index];
                return SizedBox(
                  height: 0.3.sh,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                          width: double.infinity,
                          height: 35,
                          child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Package Name',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Palette.bottombarcolor,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25))),
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Text(
                                  '${item.title}',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                                 Text(
                                   '\u{20B9}${(int.parse(item.price!) + 200).toString()}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                 Text(
                                  '\u{20B9}${item.price}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          Colors.lightGreen),
                                      elevation: MaterialStateProperty.all(20),
                                      //Defines Elevation
                                      shadowColor:
                                      MaterialStateProperty.all(Colors.black),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'BUY NOW',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        }
        else {
          return const Center(
            child: CircularIndicator(height: 0.75,),
          );
        }
      },
      future: _fetchPlans()),
    );
  }
}
