import 'package:anmor_garbh_sanskar/Screens/constants/app_constants.dart';
import 'package:anmor_garbh_sanskar/constants/pallete.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Dailty@task.dart';
import 'five@task.dart';
import 'ListView_homepage.dart';
import 'more.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String>? profileData = <String>[];
  int _selectedIndex = 0;
  final List<Widget> _widgets = <Widget>[const ListViewHomepage(), const FiveQTask(), const DailyTask(),const More()];

  @override
  void initState() {
    super.initState();
  }


  Future<bool> _onbackpress() async {
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
                          kSharedPreferences?.clear();
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
    return WillPopScope(
      onWillPop: _onbackpress,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Welcome to  Anmol Garbh Sanskar'),
          backgroundColor: Palette.bottombarcolor,
        ),
        body: Stack(
          children: [
            const SizedBox(width: double.infinity,child: Image(image: AssetImage('assets/images/back.png'),fit: BoxFit.fill)),
            IndexedStack(
              index: _selectedIndex,
              children: _widgets,
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Palette.bottombarcolor,
          selectedItemColor: Palette.BackGroundColor,
          unselectedItemColor: Colors.white,
          onTap: (index) {
            _selectedIndex = index;
            setState((){});
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.house,
                size: 22.sp,
              ),
              label: 'HOME',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.listCheck,
                size: 22.sp,
              ),
              label: '5Q Task',
              backgroundColor: Palette.bottombarcolor,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.dailymotion,
                size: 22.sp,
              ),
              label: 'Daily Task',
              backgroundColor: Palette.bottombarcolor,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.more_horiz,
                size: 22.sp,
              ),
              label: 'More',
              backgroundColor: Palette.bottombarcolor,
            ),
          ],
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }
}
