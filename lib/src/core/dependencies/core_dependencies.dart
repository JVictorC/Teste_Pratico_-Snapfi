import 'package:pokedex_snapfi/src/core/core.dart';


initCoreDependencies() {
  I.registesDependency<IHttpClient>(
    HttpClient(),
  );

  I.registesDependency<ISharedPreference>(
    SharedPreference(),
  );
}
