import 'package:flutter/material.dart';
import '../models/movieModel.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(movie.title ?? "Movie Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (movie.postedUrl != null && movie.postedUrl!.isNotEmpty)
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(movie.postedUrl!,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                      const Text('Failed to load image', style: TextStyle(color: Colors.white70))),
                ),
              )
            else
              const Center(
                child: Text("No image available", style: TextStyle(color: Colors.white70)),
              ),
            const SizedBox(height: 20),
            Text(
              movie.title ?? "Untitled",
              style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              movie.description?.isNotEmpty == true ? movie.description! : "No description available.",
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
