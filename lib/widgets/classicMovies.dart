import 'package:flutter/material.dart';
import 'package:testproject/widgets/trendingMovies.dart';

class ClassicMovies extends StatelessWidget {
  final List<String> classicMovies = [
    "assets/movies/classicMovies/40YearOldBirgin.jpg",
    "assets/movies/classicMovies/backToTheFuture.jpg",
    "assets/movies/classicMovies/grinch.jpg",
    "assets/movies/classicMovies/happyFeet.jpg",
    "assets/movies/classicMovies/HomeAlone.jpg",
    "assets/movies/classicMovies/jaws.jpg",
    "assets/movies/classicMovies/theIncredibles.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return TrendingMovies().movieCategory("Classics", classicMovies);
  }
}
