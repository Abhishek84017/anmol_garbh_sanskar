import 'package:anmor_garbh_sanskar/model/getMealModel.dart';
import 'package:anmor_garbh_sanskar/services/Rest_api.dart';
import 'package:flutter/material.dart';

class GetMeals extends StatefulWidget {
  const GetMeals({Key? key}) : super(key: key);

  @override
  State<GetMeals> createState() => _GetMealsState();
}

class _GetMealsState extends State<GetMeals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 5'),
        centerTitle: true,
      ),
      body:  FutureBuilder<List<MealsModel>>(
        future: RestApi().fetchMeals(),
        builder: (BuildContext context,  snapshot) {
          print(snapshot.data?.map((e) => e.preBreakfastSnacks?.map((e) => e.description)));
          return Text('hello');


        },

      ),
    );
  }
}

