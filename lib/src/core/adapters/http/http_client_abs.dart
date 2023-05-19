import 'package:pokedex_snapfi/src/core/core.dart';

abstract class IHttpClient {
  Future<ClientResponse> get(
    String url, {
    Map<String, String>? headers,
  });
}