import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class video extends StatefulWidget {
 late String videos;

  video(
    String e,
  ) {
    this.videos = e;
  }  

  @override
  State<video> createState() => _videoState();
}


class _videoState extends State<video> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(this.widget.videos)!,
    );
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
      player: YoutubePlayer(controller: controller),
      builder: (context, player) => Scaffold(
          extendBodyBehindAppBar: true,
          body:  Container(        color: Color.fromARGB(255, 42, 39, 59),

           child: Column( children: [player,],)
          )));
}
