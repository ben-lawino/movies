import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:movies/movie.dart';

class HttpHelper {
  final String apiKey = 'f82826bd81afab764a50ad708527178f';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming';
  final String urlLanguage = '&language=en-US';
  final String urlSearchBase = 'https://api.themoviedb.org/3/search/movie';

  Future<List?> getUpcoming() async {
    final String upcoming = '$urlBase$urlUpcoming?api_key=$apiKey$urlLanguage';
    final Uri uri = Uri.parse(upcoming);
    http.Response result = await http.get(uri);

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = jsonDecode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }

  Future<List?> findMovies(String title) async {
    final Uri uri = Uri.parse(urlSearchBase).replace(queryParameters: {
      'api_key': apiKey,
      'query': title,
    });

    http.Response result = await http.get(uri);

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = jsonDecode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }
}
