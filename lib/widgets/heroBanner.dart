import 'dart:ui' as ui;
import 'dart:html' as html;
import 'package:flutter/material.dart';

class HeroBanner extends StatelessWidget {
  final String videoId = "2LqzF5WauAw"; // Interstellar trailer

  HeroBanner({super.key}) {
    // Register the view factory once
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'youtube-iframe',
          (int viewId) => html.IFrameElement()
        ..width = 'full'
        ..height = '500'
        ..src = 'https://www.youtube.com/embed/$videoId?autoplay=1&mute=1&loop=1&playlist=$videoId&controls=0'
        ..style.border = 'none',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 250,
          width: double.infinity,
          child: HtmlElementView(viewType: 'youtube-iframe'),
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
                  // Example: Navigate to a details page
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                child: const Text("Watch Now", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
