import 'dart:convert';
import 'package:watchit/constants.dart';
import 'package:watchit/models/Movie.dart';
import 'package:http/http.dart' as http;
import 'package:watchit/models/Series.dart';

class Api {
  static const trendingUrl = '/trending/movie/day?api_key=${Constants.apiKey}';
  static const topRatedMovies = '/movie/top_rated?api_key=${Constants.apiKey}';
  static const topRatedSeries = '/tv/top_rated?api_key=${Constants.apiKey}';
  static const recommendedMovies =
      '/movie/673593/recommendations?api_key=${Constants.apiKey}';

  Future<List<Movie>> getTrendingMovies() async {
    print('Getting trending movies: GET// ' + Constants.baseUrl + trendingUrl);
    final response = await http.get(
      Uri.parse(Constants.baseUrl + trendingUrl),
    );
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      // print('Trending movies: ' + decodedData.toString());
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    print('Getting top rated movies: GET// ' +
        Constants.baseUrl +
        topRatedMovies);
    final response = await http.get(
      Uri.parse(Constants.baseUrl + topRatedMovies),
    );
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      // print('Top Rated movies: ' + decodedData.toString());
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Series>> getTopRatedSeries() async {
    print('Getting top rated series: GET// ' +
        Constants.baseUrl +
        topRatedMovies);
    final response = await http.get(
      Uri.parse(Constants.baseUrl + topRatedSeries),
    );
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      // print('Top Rated series: ' + decodedData.toString());
      return decodedData.map((series) => Series.fromJson(series)).toList();
    } else {
      throw Exception('Failed to load series');
    }
  }

  Future<List<Movie>> getRecommendedMovies(int movieId) async {
    print('Getting recommended movies: GET// ' +
        Constants.baseUrl +
        recommendedMovies);
    final response = await http.get(
      Uri.parse(Constants.baseUrl +
          '/movie/$movieId/recommendations?api_key=${Constants.apiKey}'),
    );
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      // print('Recommended movies: ' + decodedData.toString());
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load zzzzz');
    }
  }

  Future<List<Movie>> getSimilarMovies(int movieId) async {
    print('Getting similar movies: GET// ' + Constants.baseUrl);
    final response = await http.get(
      Uri.parse(Constants.baseUrl +
          '/movie/$movieId/similar?api_key=${Constants.apiKey}'),
    );
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      // print('Recommended movies: ' + decodedData.toString());
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Series>> getSimilarSeries(int serieId) async {
    print('Getting similar series: GET// ' + Constants.baseUrl);
    final response = await http.get(
      Uri.parse(Constants.baseUrl +
          '/tv/$serieId/similar?api_key=${Constants.apiKey}'),
    );
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      // print('Recommended movies: ' + decodedData.toString());
      // print('Similar series: ' + decodedData.toString());
      return decodedData.map((series) => Series.fromJson(series)).toList();
    } else {
      throw Exception('Failed to load series');
    }
  }
}
