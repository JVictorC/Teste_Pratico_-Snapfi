import 'package:mocktail/mocktail.dart';
import 'package:pokedex_snapfi/main.dart';

class _SharedPreferenceMock extends Mock implements ISharedPreference {
  
}

final sharedPreferenceMock = _SharedPreferenceMock();