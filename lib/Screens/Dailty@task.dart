
import 'package:anmor_garbh_sanskar/Screens/constants/app_constants.dart';
import 'package:anmor_garbh_sanskar/Widgets/text_button.dart';
import 'package:anmor_garbh_sanskar/constants/pallete.dart';
import 'package:anmor_garbh_sanskar/model/dailyTaskmodel.dart';
import 'package:anmor_garbh_sanskar/services/Rest_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Widgets/circular.dart';

class DailyTask extends StatefulWidget {
  const DailyTask({Key? key}) : super(key: key);

  @override
  State<DailyTask> createState() => _DailyTaskState();
}

class _DailyTaskState extends State<DailyTask> {
  bool isLoading = false;
  Map<int, bool> answer = {};
  List<Map<String, String>> addedDescription = <Map<String, String>>[];
   List<DailyQTaskModel> _dailyTask = <DailyQTaskModel>[];

   void _sendTask() async
  {
    final payload = <String, String>{
        'id': '${kSharedPreferences!.getInt('id')}',
        'status': '$addedDescription'
    };
    await RestApi.sendTask(payload).whenComplete(() => _fetchDailyTask());
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState()
  {
    super.initState();
    _fetchDailyTask();
  }


  Future<List<DailyQTaskModel>> _fetchDailyTask() async
  {
    _dailyTask = await RestApi().fetchDailyQTask(kSharedPreferences!.getInt('id')!);
    setState((){});
    return _dailyTask;
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      _dailyTask.isEmpty ? const CircularIndicator(height: 0.75,)  :  Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: _dailyTask.length,
            itemBuilder: (context, index) {
              var item = _dailyTask[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                elevation: 10,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: CheckboxListTile(
                    title: Text("${item.title}"),
                    value: item.completed == 'y' ? true : answer[index] ??
                        false,
                    onChanged: (bool? newValue) {
                      setState(() {
                        answer[index] = newValue!;
                        if (answer[index] == true) {
                          addedDescription.add({ '"' + item.id.toString() + '"'  : newValue == true ? '"' "Y" '"' : '"' "N" '"'});
                          print(addedDescription);
                        }
                        if (answer[index] == false) {
                          addedDescription.removeWhere(
                                  (element) => element.containsKey(item.id.toString()));
                        }
                      });
                    }),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
            const Divider(
              color: Colors.grey,
            ),
          ),
        ),
        isLoading ? const CircularIndicator(height: 0.75,) : SignInButton(
          text: 'Save Daily Task',
          maincolor: Palette.bottombarcolor,
          width: double.infinity - 100,
          callback: () {
            if (addedDescription.isEmpty) {
              Fluttertoast.showToast(msg: 'Task Not Added');
              return;
            }
            setState(() {
              isLoading = true;
            });
            _sendTask();
          },
        )
      ],
    );
  }
}


