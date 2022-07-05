import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioFile extends StatefulWidget {

  final String audioUrl;
  const AudioFile({Key? key, required this.audioUrl}) : super(key: key);

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration deduration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState((){
        isPlaying = event == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((duration) {
      setState((){
        deduration = duration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newDuration) {
      setState((){
        position = newDuration;
      });
    });
    super.initState();
  }
  @override
  void dispose()
  {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio File'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/earphone.jpg')),
                      shape: BoxShape.circle),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Slider(
                  min: 0,
                  max: deduration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final sliderPosition = Duration(seconds: value.toInt());
                    await audioPlayer.seek(sliderPosition);

                    await audioPlayer.resume();
                  }),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(position.toString()),
                    Text(deduration.toString())
                  ],
                ),
              ),
              CircleAvatar(
                radius: 40,
                child: IconButton(
                    iconSize: 48,
                    onPressed: () async {

                      if (isPlaying) {
                        audioPlayer.pause();
                      } else {
                        String url = 'https://apis.bhavishashah.com/${widget.audioUrl}';

                        audioPlayer.play(url);
                      }
                    },
                    icon: isPlaying
                        ? const Icon(Icons.pause)
                        : const Icon(Icons.play_arrow)),
              )
            ],
          ),
        ],
      ),
    );
  }
}