



import 'package:pokedex_snapfi/src/core/dependencies/core_dependencies.dart';
import 'package:pokedex_snapfi/src/core/dependencies/cubit_dependencies.dart';
import 'package:pokedex_snapfi/src/core/dependencies/data_dependencies.dart';
import 'package:pokedex_snapfi/src/core/dependencies/repositories_dependencies.dart';
import 'package:pokedex_snapfi/src/core/dependencies/usecases_dependencies.dart';

initAllDependencies() {
  initCoreDependencies();
  initDatasDependencies();
  initRepositoriesDependencies();
  initUseCasesDependencies();
  initCubitDependencies();
}
