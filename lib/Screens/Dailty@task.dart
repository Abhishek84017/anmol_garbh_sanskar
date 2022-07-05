import 'package:anmor_garbh_sanskar/Widgets/text_button.dart';
import 'package:anmor_garbh_sanskar/constants/pallete.dart';
import 'package:anmor_garbh_sanskar/model/dailyTaskmodel.dart';
import 'package:anmor_garbh_sanskar/services/Rest_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Widgets/circular.dart';

class DailyTask extends StatefulWidget {
  const DailyTask({Key? key}) : super(key: key);

  @override
  State<DailyTask> createState() => _DailyTaskState();
}

class _DailyTaskState extends State<DailyTask> {

  Map<int, bool> answer = {};
  List<Map<int, String>> addedDescription = <Map<int,String>>[];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DailyQTaskModel>>(
      builder: (BuildContext context,snapshot) {
        if(snapshot.hasData)
          {
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var item = snapshot.data![index];
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        elevation: 10,
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: CheckboxListTile(
                            title: Text("${item.title}"),
                            value: answer[index] ?? false,
                            onChanged: (bool? newValue) {
                              setState(() {
                                answer[index] = newValue!;
                                if (answer[index] == true) {
                                  addedDescription.add({index: newValue == true ? "Y" : "N"});
                                  print(addedDescription);
                                }
                                if (answer[index] == false) {
                                  addedDescription.remove(index);
                                  print(addedDescription);
                                }
                              });
                            }),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const Divider(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SignInButton(
                  text: 'Save Daily Task',
                  maincolor: Palette.BackGroundColor,
                  width: double.infinity - 100,
                )
              ],
            );
          }
        else
          {
            return const Center(
              child: CircularIndicator(
                height: 0.75,
              ),
            );
          }

      },
      future:  RestApi().fetchDailyQTask(),
    );
  }
}
