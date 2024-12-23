import 'package:http/http.dart' as http;
import 'dart:io';


class HttpHelper {
  final String urlKey = 'api_key = f82826bd81afab764a50ad708527178f';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=en-US';

  Future <String?> getUpcoming() async {
    final String upcoming = urlBase + urlUpcoming + urlKey + urlLanguage;
    http.Response result = await http.get(upcoming as Uri);

    if (result.statusCode == HttpStatus.ok) {
      String responseBody = result.body;
    }
    else {
      return null;
    }
  }
}
