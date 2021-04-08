import 'dart:io';
import 'package:http/http.dart' as http;

class HttpService {
  final String apiKey = '19585cba4491f17348bf5b890678c44f';
  final String baseUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=19585cba4491f17348bf5b890678c44f';

  Future<String> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      String response = result.body;
      return response;
    } else {
      print("Fail");
      return null;
    }
  }
}
