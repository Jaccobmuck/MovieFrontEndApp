import 'package:flutter/material.dart';
import 'package:testproject/widgets/trendingMovies.dart';

class ClassicMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final classicPosters = [
      'https://via.placeholder.com/120x160?text=Classic+1',
      'https://via.placeholder.com/120x160?text=Classic+2',
      'https://via.placeholder.com/120x160?text=Classic+3',
    ];

    return TrendingMovies(label: "Classics", posterUrls: classicPosters);
  }
}
