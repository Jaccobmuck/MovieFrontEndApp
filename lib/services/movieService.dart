import 'dart:convert';
import '../models/movieModel.dart';
import 'package:http/http.dart' as http;

class MovieService {
  final String _baseUrl = "http://localhost:5296/Movie";

  // Fetch all movies from the backend
  Future<List<MovieModel>> getMovies() async { // TODO: add models folder later
    try {
      final response = await http.get(Uri.parse("$_baseUrl/GetMovies"));

      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => MovieModel.fromJson(json)).toList();
      }
      else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      print("MovieService.getMovies error: $e");
      rethrow;
    }
  }

  // Fetch movies filtered by genre (e.g., "trending", "classics", etc.)
  Future<List<MovieModel>> getMoviesByGenre(String genre) async {
    try {
      final response = await http.get(
        Uri.parse("$_baseUrl/GetMoviesByGenre?genre=$genre"),
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => MovieModel.fromJson(json)).toList();
      }
      else {
        throw Exception("Failed to load movies for genre: $genre");
      }
    } catch (e) {
      print("MovieService.getMoviesByGenre error: $e");
      rethrow;
    }
  }

  // Fetch a single movie by its ID
  Future<MovieModel> getMovieById(int id) async {
    try {
      final response = await http.get(Uri.parse("$_baseUrl/GetMoviesById?id=$id"));

      if (response.statusCode == 200) {
        return MovieModel.fromJson(json.decode(response.body));
      }
      else {
        throw Exception("Failed to load movie with ID: $id");
      }
    } catch (e) {
      print("getMovieById error: $e");
      rethrow;
    }
  }
}
