import 'dart:async';
import 'package:anmor_garbh_sanskar/Screens/become_premium.dart';
import 'package:anmor_garbh_sanskar/Screens/chat_screen.dart';
import 'package:anmor_garbh_sanskar/Screens/get_meal.dart';
import 'package:anmor_garbh_sanskar/Widgets/dropdownbutton.dart';
import 'package:anmor_garbh_sanskar/constants/pallete.dart';
import 'package:anmor_garbh_sanskar/provider/languageprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  Future<bool> _onBackPress() async {
    return await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(AppLocalizations.of(context)!.wantToExit),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: Text(
                          AppLocalizations.of(context)!.no,
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.black),
                        )),
                    TextButton(
                        onPressed: () async {
                          Navigator.pop(context, true);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.yes,
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.black),
                        )),
                  ],
                )) ??
        false;
  }

  final StreamController<String> _languageController =
      StreamController<String>.broadcast();

  @override
  Widget build(BuildContext context) {
    final List<String> _menuItems = <String>[
      AppLocalizations.of(context)!.about,
      AppLocalizations.of(context)!.profile,
      AppLocalizations.of(context)!.contactUs,
      AppLocalizations.of(context)!.packages,
      AppLocalizations.of(context)!.gelMeal,
      AppLocalizations.of(context)!.reports,
      AppLocalizations.of(context)!.support,
      AppLocalizations.of(context)!.language,
      AppLocalizations.of(context)!.logout
    ];
    final List<String> _languages = <String>[
      AppLocalizations.of(context)!.hindi,
      AppLocalizations.of(context)!.english,
      AppLocalizations.of(context)!.gujarati
    ];
    return GridView.builder(
      itemCount: _menuItems.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
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
            onTap: () {
              if (item == AppLocalizations.of(context)!.logout) {
                _onBackPress();
              }
              if (item == AppLocalizations.of(context)!.packages) {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const BecomePremiumPage()));
              }
              if (item == AppLocalizations.of(context)!.support) {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const ChatScreen()));
              }
              if (item == AppLocalizations.of(context)!.gelMeal) {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => const GetMeals()));
              }
              if (item == AppLocalizations.of(context)!.language) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Select Language'),
                              ),
                            ),
                            StreamBuilder(
                              initialData:
                                  AppLocalizations.of(context)!.english,
                              stream: _languageController.stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<String> snapshot) {
                                return DropDownButtonWidget(
                                  hinttext: 'Select Language',
                                  value: snapshot.data,
                                  items: _languages.map((e) {
                                    return DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    );
                                  }).toList(),
                                  callback: (value) {
                                    _languageController.sink.add(value);
                                    final provider =
                                        Provider.of<ChangeLanguageProvider>(
                                            context,
                                            listen: false);
                                    if (value ==
                                        AppLocalizations.of(context)!.hindi) {
                                      provider.setLocale('hi');
                                    } else if (value ==
                                        AppLocalizations.of(context)!.english) {
                                      provider.setLocale('en');
                                    } else if (value ==
                                        AppLocalizations.of(context)!
                                            .gujarati) {
                                      provider.setLocale('gu');
                                    }
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.person,
                  size: 32.sp,
                ),
                Text(item,
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Palette.BackGroundColor,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        );
      },
    );
  }
}
