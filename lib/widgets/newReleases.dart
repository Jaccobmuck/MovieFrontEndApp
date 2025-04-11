import 'package:flutter/material.dart';
import 'package:testproject/widgets/trendingMovies.dart';

class NewReleases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TrendingMovies().movieCategory("New Releases", "new_releases");
  }
}
