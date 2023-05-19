import 'dart:convert';

import 'package:http/http.dart';
import 'package:pokedex_snapfi/src/core/core.dart';

extension ClientResponseExt on Response {
  ClientResponse toClientResponse() => ClientResponse(
        body: jsonDecode(body),
        statusCode: statusCode,
      );
}