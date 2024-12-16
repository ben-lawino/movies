import 'package:http/http.dart' as http;

class HttpHelper{
  final String urlKey = 'api_key = f82826bd81afab764a50ad708527178f';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=en-US';
}