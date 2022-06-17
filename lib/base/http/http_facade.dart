import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpFacade {
  late String url;

  Future<Response> post({Object? body}) async {
    final Uri uri = Uri.parse(url);
    http.Response response = await http.post(
      uri,
      body: body,
    );
    return response;
  }

  Future<Response> get(String url) async {
    final Uri uri = Uri.parse(url);
    http.Response response = await http.get(
      uri,
    );
    return response;
  }
}