import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer? advancedPlayer;

  const AudioFile({Key? key, this.advancedPlayer}) : super(key: key);

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration _duration = Duration();
  Duration _position = Duration();
  final String path = "https://www.ne.jp/asahi/music/myuu/wave/asibue.mp3";
  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;
  List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];

  @override
  void initState() {
    super.initState();
    this.widget.advancedPlayer!.onDurationChanged.listen((event) {
      setState(() {
        _duration = event;
      });
    });
    this.widget.advancedPlayer!.onAudioPositionChanged.listen((po) {
      setState(() {
        _position = po;
      });
    });
    this.widget.advancedPlayer!.setUrl(path);
  }

  Widget btnStart() {
    return IconButton(
      padding: const EdgeInsets.only(bottom: 10),
      onPressed: () {
        if (isPlaying == false) {
          this.widget.advancedPlayer!.play(path);
          setState(() {
            isPlaying = true;
          });
        } else if (isPlaying == true) {
          this.widget.advancedPlayer!.pause();
          setState(() {
            isPlaying = false;
          });
        }
      },
      icon: isPlaying == false ? Icon(_icons[0]) : Icon(_icons[1]),
    );
  }

  Widget loadAsset() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btnStart(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
          ),
          loadAsset(),
        ],
      ),
    );
  }
}
