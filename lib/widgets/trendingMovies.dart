import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TrendingMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return movieCategory("Trending", "trending");
  }

  Widget movieCategory(String label, String category) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          SizedBox(
            height: 160,
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('movies')
                  .where('category', isEqualTo: category)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final movies = snapshot.data!.docs;

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final data = movies[index].data() as Map<String, dynamic>;
                    return movieCard(data['posterUrl'] ?? '');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget movieCard(String imageUrl) {
    if (imageUrl.isEmpty) {
      print("❌ Missing posterUrl — showing placeholder.");
    } else {
      print("✅ Showing image: $imageUrl");
    }

    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: imageUrl.isNotEmpty
              ? NetworkImage(imageUrl)
              : const NetworkImage("https://via.placeholder.com/120x160?text=No+Image"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}