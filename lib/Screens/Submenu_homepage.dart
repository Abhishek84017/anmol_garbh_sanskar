import 'package:anmor_garbh_sanskar/constants/pallete.dart';
import 'package:anmor_garbh_sanskar/model/submenu_model.dart';
import 'package:anmor_garbh_sanskar/players/audioplayer.dart';
import 'package:anmor_garbh_sanskar/players/youtubeplayer.dart';
import 'package:anmor_garbh_sanskar/services/Rest_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widgets/circular.dart';
class SubMenu extends StatefulWidget {
 final Map<String,String> data;
  const SubMenu({Key? key, required  this.data}) : super(key: key);

  @override
  State<SubMenu> createState() => _SubMenuState();
}
class _SubMenuState extends State<SubMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submenus'),
      ),
      body: FutureBuilder<List<SubMenuHomepageModel>>(
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
                                onTap: ()
                                {
                                  if(item.type == 'audio')
                                    {

                                      Navigator.push(context, CupertinoPageRoute(builder: (context) => AudioFile(audioUrl: '${item.content}')));
                                    }
                                  if(item.type == 'video')
                                    {
                                      print('hgello');
                                      Navigator.push(context, CupertinoPageRoute(builder: (context) => YoutubeVideoPlayer(videoCode: "${item.content}")));
                                    }
                                },
                                title: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '${item.title}',
                                      style: TextStyle(
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
                                onTap: ()
                                {
                                  if(item.type == 'audio')
                                  {

                                    Navigator.push(context, CupertinoPageRoute(builder: (context) => AudioFile(audioUrl: '${item.content}')));
                                  }
                                  if(item.type == 'video')
                                  {
                                    print('hgello');
                                    Navigator.push(context, CupertinoPageRoute(builder: (context) => YoutubeVideoPlayer(videoCode: "${item.content}")));
                                  }
                                },
                                title: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${item.title}',
                                      style: TextStyle(
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
                }) : const Center(child: Text('No Data Found'),);
          } else {
            return const Center(
              child: CircularIndicator(
                height: 0.75,
              ),
            );
          }
        },
        future: RestApi().fetchSubMenus(widget.data)
      ),
    );
  }
}
