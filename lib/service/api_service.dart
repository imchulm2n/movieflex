import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieflex/models/moive_model.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";

  static Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> popularMovieInstance = [];
    final url = Uri.parse("$baseUrl/popular");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> movies = json.decode(response.body)['results'];
      for (var movie in movies) {
        popularMovieInstance.add(MovieModel.fromJson(movie));
      }
      return popularMovieInstance;
    }
    throw Error();
  }
}
