import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailerWidget extends StatefulWidget {
  final String youtubeKey;
  const MovieTrailerWidget({
    super.key,
    required this.youtubeKey,
  });

  @override
  State<MovieTrailerWidget> createState() => _MovieTrailerWidgetState();
}

class _MovieTrailerWidgetState extends State<MovieTrailerWidget> {
  String? videoId;

  late final YoutubePlayerController _controller;
  @override
  void initState() {
    videoId = YoutubePlayer.convertUrlToId(widget.youtubeKey);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final player = YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Трейлер'),
      ),
      body: YoutubePlayerBuilder(
        player: player,
        builder: (context, player) {
          return Column(
            children: [
              // some widgets

              player,
              //some other widgets
            ],
          );
        },
      ),
    );
  }
}
