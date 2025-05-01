import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  final String label;
  final List<String> posterUrls;

  const TrendingMovies({super.key, required this.label, required this.posterUrls});

  @override
  Widget build(BuildContext context) {
    return movieCategory(label, posterUrls);
  }

  Widget movieCategory(String label, List<String> posters) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: posters.length,
              itemBuilder: (context, index) {
                return movieCard(posters[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget movieCard(String imageUrl) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(imageUrl.isNotEmpty
              ? imageUrl
              : "https://via.placeholder.com/120x160?text=No+Image"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
