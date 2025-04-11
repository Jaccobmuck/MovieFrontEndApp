import 'package:flutter/material.dart';
import 'package:testproject/widgets/trendingMovies.dart';

class ClassicMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TrendingMovies().movieCategory("Classics", "classics");
  }
}