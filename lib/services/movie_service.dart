import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mytest/models/movies.dart';

class MovieService {
  static Future<List<Movie>> fetchMovies() async {
    final url = Uri.parse('https://whoa.onrender.com/whoas/random?results=20');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}