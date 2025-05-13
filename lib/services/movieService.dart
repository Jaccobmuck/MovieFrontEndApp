import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/movieModel.dart';

class MovieService {
  final String _baseUrl = "https://localhost:7106/Movie";

  Future<List<MovieModel>> getMovies() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('jwt');

      final response = await http.get(
        Uri.parse("$_baseUrl/GetMovies"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => MovieModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      print("MovieService.getMovies error: $e");
      rethrow;
    }
  }

  Future<List<MovieModel>> getMoviesByGenre(String genre) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('jwt');

      final response = await http.get(
        Uri.parse("$_baseUrl/GetMoviesByGenre?genre=$genre"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => MovieModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load movies for genre: $genre");
      }
    } catch (e) {
      print("MovieService.getMoviesByGenre error: $e");
      rethrow;
    }
  }

  Future<MovieModel> getMovieById(int id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('jwt');

      final response = await http.get(
        Uri.parse("$_baseUrl/GetMoviesById?id=$id"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return MovieModel.fromJson(json.decode(response.body));
      } else {
        throw Exception("Failed to load movie with ID: $id");
      }
    } catch (e) {
      print("getMovieById error: $e");
      rethrow;
    }
  }
}
