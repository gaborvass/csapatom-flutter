import 'dart:io';
import 'dart:async';
import 'dart:convert';

class RequestHandler {

  static String federations = 'https://adatbank-backend.herokuapp.com/federations';

  static Future<List<dynamic>> LoadFederations() async {
    List<dynamic> result;
    String response = await _ExecuteRequest(federations);
    result = JSON.decode(response);
    return result;
  }

  static Future<List<dynamic>> LoadLeagues(String seasonId, String federationId) async {
    var url = "https://adatbank-backend.herokuapp.com/leagues/$seasonId/$federationId";
    List<dynamic> result;
    String response = await _ExecuteRequest(url);
    result = JSON.decode(response);
    return result;
  }


  static Future<String> _ExecuteRequest(String url) async {
    String resultTxt;
    var httpClient = new HttpClient();
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        resultTxt = await response.transform(UTF8.decoder).join();
      } else {
        resultTxt =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      resultTxt = 'Failed getting IP address';
    }
    return resultTxt;
  }
}
