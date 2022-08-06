import 'package:anmor_garbh_sanskar/constants/pallete.dart';
import 'package:anmor_garbh_sanskar/services/Rest_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../players/youtubeplayer.dart';
import 'constants/app_constants.dart';

class GetMeals extends StatefulWidget {
  const GetMeals({Key? key}) : super(key: key);

  @override
  State<GetMeals> createState() => _GetMealsState();
}

class _GetMealsState extends State<GetMeals> {
  static const TextStyle _style = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 5'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>?>(
        future: RestApi().fetchMeals(kSharedPreferences!.getInt('id')!),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data?[index];
                if (snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10.0),
                              color: Palette.primaryColor.withOpacity(0.6),
                              child: Text(
                                item!.keys.toList()[index],
                                style: _style,
                              ),
                            ),
                            for (var map in item.values.toList()[index])
                              ListTile(
                                title: Text(map['description']),
                                trailing: map['code'] != null
                                    ? ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      YoutubeVideoPlayer(
                                                          videoCode:
                                                              "${map['code']}")));
                                        },
                                        child: const Text(
                                          'Recipe',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                                Palette.BackGroundColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(36.0),
                                                side: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    width: 0.5))),
                                      )
                                    : const SizedBox.shrink(),
                              ),
                          ],
                        ),
                      );
                    },
                    itemCount: item!.length,
                  );
                } else {
                  return const Center(
                    child: Text('No Data Found'),
                  );
                }
              },
            );
          }
          return const Center(
            child: Text('No Data Found'),
          );
        },
      ),
    );
  }
}
