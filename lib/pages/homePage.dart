import 'package:flutter/material.dart';
import '../widgets/trendingMovies.dart';
import '../widgets/heroBanner.dart';
import '../widgets/bottomNavBar.dart';

class HomePage extends StatelessWidget {
  final List<String> trendingPosters = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5dHUrUa99rxiCqLganH7SkpkA2JsLqelYSg&s'
  ];

  final List<String> newReleasePosters = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5dHUrUa99rxiCqLganH7SkpkA2JsLqelYSg&s'
  ];

  final List<String> classicPosters = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5dHUrUa99rxiCqLganH7SkpkA2JsLqelYSg&s'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        leading: backButton(context),
        title: const Text(
          "Movie Rentals",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // implement search later
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroBanner(),
            TrendingMovies(label: "Trending", posterUrls: trendingPosters),
            TrendingMovies(label: "New Releases", posterUrls: newReleasePosters),
            TrendingMovies(label: "Classics", posterUrls: classicPosters),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget backButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () {
        // You may want to change this later to pop or navigate elsewhere
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
    );
  }
}
