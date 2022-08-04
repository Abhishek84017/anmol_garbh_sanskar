import 'package:anmor_garbh_sanskar/Widgets/circular.dart';
import 'package:anmor_garbh_sanskar/constants/pallete.dart';
import 'package:anmor_garbh_sanskar/model/rechivechatModel.dart';
import 'package:anmor_garbh_sanskar/services/Rest_api.dart';
import 'package:flutter/material.dart';

import 'constants/app_constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<ReceiveChatModel> _messages = <ReceiveChatModel>[];

  void _sendMessageMethod() async {
    final payload = <String, String>{
      'id': '${kSharedPreferences!.getInt('id')}',
      'message': _controller.text
    };
    await RestApi.sendMessage(payload);
    _controller.clear();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('ChatBoat'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FutureBuilder<List<ReceiveChatModel>>(
            future:
                RestApi().fetchChatMessages(kSharedPreferences!.getInt('id')!),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                _messages = snapshot.data;
                if (_messages.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      reverse: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _messages.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = _messages[index];
                        return Container(
                          padding: const EdgeInsets.only(
                              left: 14, right: 14, top: 10, bottom: 10),
                          child: Container(
                            alignment: (item.type == 's'
                                ? Alignment.bottomRight
                                : Alignment.centerLeft),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (item.type == 's'
                                    ? Palette.BackGroundColor
                                    : Colors.red[200]),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                item.message ?? '',
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                      'Say hi...',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  );
                }
              } else {
                return const Center(
                    child: CircularIndicator(
                  height: 0.75,
                ));
              }
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 20),
                    child: FloatingActionButton(
                      onPressed: () {
                        _sendMessageMethod();
                      },
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 18,
                      ),
                      backgroundColor: Palette.bottombarcolor,
                      elevation: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
