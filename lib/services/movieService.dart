import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieService {
  final String _baseUrl = "http://localhost:5296/Movie";

  // Fetch all movies from the backend
  Future<List<Map<String, dynamic>>> getMovies() async { // TODO: add models folder later
    try {
      final response = await http.get(Uri.parse("$_baseUrl/GetMovies"));

      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        return jsonList.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      print("MovieService.getMovies error: $e");
      rethrow;
    }
  }

  // Fetch movies filtered by genre (e.g., "trending", "classics", etc.)
  Future<List<Map<String, dynamic>>> getMoviesByGenre(String genre) async {
    try {
      final response = await http.get(
        Uri.parse("$_baseUrl/GetMoviesByGenre?genre=$genre"),
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData.cast<Map<String, dynamic>>();
      } else {
        throw Exception("Failed to load movies for genre: $genre");
      }
    } catch (e) {
      print("MovieService.getMoviesByGenre error: $e");
      rethrow;
    }
  }

  // Fetch a single movie by its ID
  Future<Map<String, dynamic>> getMovieById(int id) async {
    try {
      final response = await http.get(Uri.parse("$_baseUrl/GetMoviesById?id=$id"));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception("Failed to load movie with ID: $id");
      }
    } catch (e) {
      print("getMovieById error: $e");
      rethrow;
    }
  }
}
