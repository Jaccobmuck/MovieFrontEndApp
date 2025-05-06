import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HeroBanner extends StatefulWidget {
  @override
  _HeroBannerState createState() => _HeroBannerState();
}

class _HeroBannerState extends State<HeroBanner> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=2LqzF5WauAw");
    if (videoId == null) throw Exception("Invalid YouTube URL");

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true, // needed to avoid browser blocking
        loop: true,
        hideControls: true,
        disableDragSeek: true,
        showLiveFullscreenButton: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 250,
          width: double.infinity,
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: false,
            progressIndicatorColor: Colors.deepPurple,
          ),
        ),
        Container(
          height: 250,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.6), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          left: 20,
          bottom: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Featured Movie: Interstellar",
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  _controller.pause();
                  // TODO: Navigate to detail screen
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                child: const Text(
                  "Watch Now",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
