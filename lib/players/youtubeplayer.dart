import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YoutubeVideoPlayer extends StatefulWidget {
  const YoutubeVideoPlayer({Key? key, required this.videoCode})
      : super(key: key);
  final String videoCode;

  @override
  _YoutubeVideoPlayerState createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    _initController();
    super.initState();
  }

  @override
  void dispose() {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: YoutubePlayer(
              controller: _controller, width: 1.0.sw, aspectRatio: 16 / 9),
        ));
  }

  void _initController() {
    var videoCode = widget.videoCode;
    var uri = Uri.tryParse(widget.videoCode);

    /*if (uri != null && uri.queryParameters.containsKey('v')) {
      videoCode = uri.queryParameters['v'] ?? '';
    }*/

    _controller =   YoutubePlayerController(
        initialVideoId: videoCode, flags: const YoutubePlayerFlags());
    _controller.addListener(_controllerListener);
  }

  void _controllerListener() {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      setState(() {});
    }
  }
}
