import 'package:flutter/material.dart';
import 'package:testproject/widgets/trendingMovies.dart';

class NewReleases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newReleasePosters = [
      'https://via.placeholder.com/120x160?text=New+1',
      'https://via.placeholder.com/120x160?text=New+2',
      'https://via.placeholder.com/120x160?text=New+3',
    ];

    return TrendingMovies(label: "New Releases", posterUrls: newReleasePosters);
  }
}
