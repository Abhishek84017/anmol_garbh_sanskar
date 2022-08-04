import 'package:anmor_garbh_sanskar/Screens/become_premium.dart';
import 'package:anmor_garbh_sanskar/Screens/chat_screen.dart';
import 'package:anmor_garbh_sanskar/Screens/get_meal.dart';
import 'package:anmor_garbh_sanskar/constants/pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);
  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {

  final List<String> _menuItems = <String>['About','Profile','Contacts Us','Packages','Get Meal','Reports','Support','Logout'];


  Future<bool> _onBackPress() async {
    return await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Do you want to exit'),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  'no',
                  style:
                  TextStyle(fontSize: 18.sp, color: Colors.black),
                )),
            TextButton(
                onPressed: () async {
                  Navigator.pop(context, true);
                },
                child: Text(
                  'Yes',
                  style:
                  TextStyle(fontSize: 18.sp, color: Colors.black),
                )),
          ],
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: _menuItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
          crossAxisSpacing: 1.w,
          mainAxisSpacing: 1.w,
          childAspectRatio: (2 / 1.2),
        ),
        itemBuilder: (context, index) {
          var item = _menuItems[index];
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Palette.bottombarcolor, width: 0.05),
            ),
            child: InkWell(
              onTap: ()
              {
                if(item == 'Logout')
                  {
                    _onBackPress();
                  }
                if(item == 'Packages')
                {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => const BecomePremiumPage()));
                }
                if(item == 'Support')
                {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => const ChatScreen()));
                }
                if(item == 'Get Meal')
                {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => const GetMeals()));
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.person,size: 32.sp,),
                  Text(item,
                      style: TextStyle(fontSize: 18.sp, color: Palette.BackGroundColor,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          );
        },
      );
  }
}
