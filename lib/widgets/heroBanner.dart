import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HeroBanner extends StatefulWidget {
  @override
  _HeroBannerState createState() => _HeroBannerState();
}

class _HeroBannerState extends State<HeroBanner> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/movies/InterstellarTrailer.mp4")
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
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
        Container(
          height: 250,
          child: _controller.value.isInitialized
              ? VideoPlayer(_controller)
              : Center(child: CircularProgressIndicator()),
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                child: const Text(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  "Watch Now",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
