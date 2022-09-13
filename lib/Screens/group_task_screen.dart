import 'package:anmor_garbh_sanskar/Widgets/pdfviewer.dart';
import 'package:anmor_garbh_sanskar/constants/pallete.dart';
import 'package:anmor_garbh_sanskar/model/groupTaskModel.dart';
import 'package:anmor_garbh_sanskar/players/audioplayer.dart';
import 'package:anmor_garbh_sanskar/players/youtubeplayer.dart';
import 'package:anmor_garbh_sanskar/services/Rest_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widgets/circular.dart';
import 'contentScreen.dart';

class GroupTaskScreen extends StatefulWidget {
  final Map<String, String> data;

  const GroupTaskScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<GroupTaskScreen> createState() => _GroupTaskScreenState();
}

class _GroupTaskScreenState extends State<GroupTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Data'),
      ),
      body: FutureBuilder<List<GroupTaskModel>>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var item = snapshot.data![index];
                        if (index.isEven) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
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
                                    color:
                                        Palette.bottombarcolor.withOpacity(0.5),
                                    child: ListTile(
                                      onTap: () {
                                        if (item.type == 'audio') {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) => AudioFile(
                                                      audioUrl:
                                                          '${item.content}')));
                                        }
                                        if (item.type == 'video') {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      YoutubeVideoPlayer(
                                                          videoCode:
                                                              "${item.content}")));
                                        }
                                        if (item.type == 'pdf') {
                                          Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                              builder: (context) => PdfViewer(
                                                webPdf: "${item.content}",
                                              ),
                                            ),
                                          );
                                        }
                                        if (item.type == 'custom') {
                                          Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                              builder: (context) =>
                                                  ContentScreen(
                                                content: "${item.content}",
                                              ),
                                            ),
                                          );
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
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
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
                                      onTap: () {
                                        if (item.type == 'audio') {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) => AudioFile(
                                                      audioUrl:
                                                          '${item.content}')));
                                        }
                                        if (item.type == 'video') {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      YoutubeVideoPlayer(
                                                          videoCode:
                                                              "${item.content}")));
                                        }
                                        if (item.type == 'custom') {
                                          Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                              builder: (context) =>
                                                  ContentScreen(
                                                content: "${item.content}",
                                              ),
                                            ),
                                          );
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
                                ],
                              ),
                            ),
                          );
                        }
                      })
                  : const Center(
                      child: Text('No Data Found'),
                    );
            } else {
              return const Center(
                child: CircularIndicator(
                  height: 0.75,
                ),
              );
            }
          },
          future: RestApi().fetchGroupTask(widget.data)),
    );
  }
}
