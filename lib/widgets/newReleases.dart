import 'package:flutter/material.dart';
import 'package:testproject/widgets/trendingMovies.dart';

class NewReleases extends StatelessWidget {
  final List<String> newReleaseMovies = [
    "assets/movies/newReleases/captianAmerica.jpg",
    "assets/movies/newReleases/lilo_Stitch.jpg",
    "assets/movies/newReleases/liveActionHowToTrainYourDragon.jpg",
    "assets/movies/newReleases/minecraftMovie.jpg",
    "assets/movies/newReleases/wicked.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return TrendingMovies().movieCategory("New Releases", newReleaseMovies);
  }
}
