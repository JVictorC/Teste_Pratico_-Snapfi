import 'package:mocktail/mocktail.dart';
import 'package:pokedex_snapfi/main.dart';

class _HttpClientMock extends Mock implements IHttpClient {
  
}


final httpClientMock = _HttpClientMock();
