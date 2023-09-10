import 'dart:convert';
import '../Controller/constants.dart';
import '../Model/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';
  static const _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _upcomeUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final responce = await http.get(Uri.parse(_topRatedUrl));
    if (responce.statusCode == 200) {
      final decodeData = json.decode(responce.body)['results'] as List;
      return decodeData.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getUpcomeMovies() async {
    final responce = await http.get(Uri.parse(_upcomeUrl));
    if (responce.statusCode == 200) {
      final decodeData = json.decode(responce.body)['results'] as List;
      return decodeData.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('Somethig happened');
    }
  }
}
