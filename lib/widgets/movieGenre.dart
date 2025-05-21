import 'package:flutter/material.dart';
import '../models/movieModel.dart';
import '../services/movieService.dart';
import '../pages/movieDetailsPage.dart'; // import your detail page

class MovieGenre extends StatefulWidget {
  final String label;
  final String genre;

  const MovieGenre({super.key, required this.label, required this.genre});

  @override
  State<MovieGenre> createState() => _MovieGenreState();
}

class _MovieGenreState extends State<MovieGenre> {
  late Future<List<MovieModel>> _movies;

  @override
  void initState() {
    super.initState();
    _movies = MovieService().getMoviesByGenre(widget.genre);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label,
              style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          SizedBox(
            height: 160,
            child: FutureBuilder<List<MovieModel>>(
              future: _movies,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("Error loading ${widget.genre}", style: const TextStyle(color: Colors.white));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text("No ${widget.genre} movies found", style: const TextStyle(color: Colors.white));
                }

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final movie = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailPage(movie: movie),
                          ),
                        );
                      },
                      child: movieCard(movie.postedUrl ?? ''),
                    );
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
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(
              imageUrl.isNotEmpty ? imageUrl : 'https://via.placeholder.com/120x160?text=No+Image'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
