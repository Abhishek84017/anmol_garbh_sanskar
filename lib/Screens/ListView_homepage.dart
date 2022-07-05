import 'package:anmor_garbh_sanskar/Screens/Submenu_homepage.dart';
import 'package:anmor_garbh_sanskar/constants/pallete.dart';
import 'package:anmor_garbh_sanskar/services/Rest_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widgets/circular.dart';
import '../model/menuModel.dart';

class ListViewHomepage extends StatefulWidget {
  const ListViewHomepage({Key? key}) : super(key: key);

  @override
  State<ListViewHomepage> createState() => _ListViewHomepageState();
}
class _ListViewHomepageState extends State<ListViewHomepage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MenuModel>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty ? ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var item = snapshot.data![index];
                  if (index.isEven) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      child: SizedBox(
                        height: 100,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Card(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10))),
                              color: Palette.bottombarcolor.withOpacity(0.5),
                              child: ListTile(
                                onTap: (){
                                  if(item.type == 'menu')
                                  {
                                    var id = {
                                      'id' : item.id.toString()
                                    };
                                    Navigator.push(context, CupertinoPageRoute(builder: (context) => SubMenu(data: id)));
                                  }
                                },
                                title: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '${item.title}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ),
                            item.icon == null
                                ? const Positioned(
                                    top: 3,
                                    left: -25,
                                    child: CircleAvatar(
                                      radius: 47,
                                      backgroundImage: AssetImage(
                                          'assets/images/download.png'),
                                    ),
                                  )
                                : Positioned(
                                    top: 3,
                                    left: -25,
                                    child: CircleAvatar(
                                      radius: 47,
                                      backgroundImage: NetworkImage('https://apis.bhavishashah.com/${item.icon}'),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      child: SizedBox(
                        height: 100,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Card(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              color: Colors.lightGreen.withOpacity(0.5),
                              child: ListTile(
                                onTap: (){
                                  print(item.type);
                                  print(item.id);
                                  if(item.type == 'menu')
                                    {
                                      var id = {
                                        'id' : item.id.toString()
                                      };
                                      Navigator.push(context, CupertinoPageRoute(builder: (context) => SubMenu(data: id)));
                                    }
                                },
                                title: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${item.title}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ),
                            item.icon == null  ? Positioned(
                              top: 3,
                              right: -25,
                              child: CircleAvatar(
                                radius: 47,
                                backgroundImage:
                                    AssetImage('assets/images/download.png'),
                              ),
                            ) : Positioned(
                              top: 3,
                              right: -25,
                              child: CircleAvatar(
                                radius: 47,
                                backgroundImage:
                                NetworkImage('https://apis.bhavishashah.com/${item.icon}'),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                }) : Center(child: Text('No Data Found'),);
          } else {
            return const Center(
              child: CircularIndicator(
                height: 0.75,
              ),
            );
          }
        },
        future: RestApi().fetchMenus(),
      );
  }
}
