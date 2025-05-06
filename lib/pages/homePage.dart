import 'package:flutter/material.dart';
import 'package:testproject/widgets/movieGenre.dart';
import '../widgets/heroBanner.dart';
import '../widgets/bottomNavBar.dart';
import '../widgets/movieGenre.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text("Movie Rentals", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // TODO: Implement search
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroBanner(),
            const MovieGenre(label: "Trending", genre: "trending"),
            const MovieGenre(label: "New Releases", genre: "new_releases"),
            const MovieGenre(label: "Classics", genre: "classics"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
