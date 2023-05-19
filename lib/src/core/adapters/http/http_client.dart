import 'package:http/http.dart' as http;
import 'package:pokedex_snapfi/src/core/core.dart';


class HttpClient implements IHttpClient {

  @override
  Future<ClientResponse> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      return response.toClientResponse();
    } catch (error) {
      throw error.toString();
    }
  }
}
