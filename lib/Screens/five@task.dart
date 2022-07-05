import 'package:anmor_garbh_sanskar/Screens/constants/app_constants.dart';
import 'package:anmor_garbh_sanskar/constants/pallete.dart';
import 'package:anmor_garbh_sanskar/players/youtubeplayer.dart';


import 'package:anmor_garbh_sanskar/services/Rest_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widgets/circular.dart';
import '../model/fiveqModel.dart';
class FiveQTask extends StatefulWidget {
  const FiveQTask({Key? key}) : super(key: key);

  @override
  State<FiveQTask> createState() => _FiveQTaskState();
}
class _FiveQTaskState extends State<FiveQTask> {
  @override
  Widget build(BuildContext context) {
   return FutureBuilder<List<FiveQModel>>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!.isNotEmpty ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var item = snapshot.data![index];
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                        child: SizedBox(
                          height: 100,
                          child: Card(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            color: Palette.bottombarcolor.withOpacity(0.5),
                            child: ListTile(
                              onTap: ()
                              {
                                Navigator.push(context, CupertinoPageRoute(builder: (context) => YoutubeVideoPlayer(videoCode: "${item.videoLink}")));
                              },
                              title: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${item.description}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                        ),
                      );
                    }
                  ) : const Center(child: Text('No Data Found'),);
            } else {
              return const Center(
                child: CircularIndicator(
                  height: 0.75,
                ),
              );
            }
          },
          future: RestApi().fetchFiveQTask(kSharedPreferences!.getInt('id')!),
      );
  }
}
