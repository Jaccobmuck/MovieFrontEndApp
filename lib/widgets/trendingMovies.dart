import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  final List<String> trendingMovies = [
    "assets/movies/trendingMovies/bladerunner2049.jpg",
    "assets/movies/trendingMovies/Interstellar.jpg",
    "assets/movies/trendingMovies/Oppenheimer.jpg",
    "assets/movies/trendingMovies/Creed3.jpg",
    "assets/movies/trendingMovies/2Fast2Furious.jpg",
    "assets/movies/trendingMovies/tokyoDrift.jpg",
    "assets/movies/Smile.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return movieCategory("Trending", trendingMovies);
  }

  Widget movieCategory(String category, List<String> movies) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(category, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) => movieCard(movies[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget movieCard(String imagePath) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}
