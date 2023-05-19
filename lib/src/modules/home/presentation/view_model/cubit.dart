import 'package:bloc/bloc.dart';
import 'package:pokedex_snapfi/main.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit({
    required IGetPokemonUsecase getPokemonUsecase,
    required ISaveSearchedPokemonHistoryUseCase
        saveSearchedPokemonHistoryUseCase,
    required IReadSearchedPokemonHistoryUseCase
        readSearchedPokemonHistoryUseCase,
  })  : _getPokemonUsecase = getPokemonUsecase,
        _saveSearchedPokemonHistoryUseCase = saveSearchedPokemonHistoryUseCase,
        _readSearchedPokemonHistoryUseCase = readSearchedPokemonHistoryUseCase,
        super(
          InitialState(),
        );

  final IGetPokemonUsecase _getPokemonUsecase;
  final ISaveSearchedPokemonHistoryUseCase _saveSearchedPokemonHistoryUseCase;
  final IReadSearchedPokemonHistoryUseCase _readSearchedPokemonHistoryUseCase;

  List<PokemonEntity> pokemonsInHistory = [];

  PokemonEntity? pokemonSearch;

  FilterTypeEntity filterTypeEntity = FilterTypeEntity.number;

  Future<void> clearSearch() async {
    await readPokemonsHistory();
  }

  void changeTypeFilter(FilterTypeEntity filterTypeEntity) {
    this.filterTypeEntity = filterTypeEntity;
  }

  Future<void> _savePokemonInHistory(PokemonEntity pokemon) async {
    final result = await _saveSearchedPokemonHistoryUseCase(
      pokemon,
    );

    if (result.isError) throw result.error!;

    if (result.value == true) {
      return;
    }
  }

  Future<void> getPokemon(String textSearch) async {
    if (filterTypeEntity == FilterTypeEntity.name) {
      if (textSearch.isNumeric) {
        emit(ErrorSearchPokemonState("Pokemon não localizado"));

        return;
      }

      _getPokemonByName(textSearch);
    } else {
      if (!textSearch.isNumeric) {
        emit(ErrorSearchPokemonState("Pokemon não localizado"));

        return;
      }
      _getPokemonByNumber(textSearch);
    }
  }

  Future<void> _getPokemonByName(String pokemonName) async {
    try {
      emit(LoadingSearchPokemon());

      final result = await _getPokemonUsecase(
        namePokemon: pokemonName,
        filterTypeEntity: filterTypeEntity,
      );

      if (result.isError) throw result.error!;

      _savePokemonInHistory(result.value!);

      pokemonSearch = result.value!;

      emit(LoadedPokemonState(result.value!));
    } on GetPokemonError catch (e) {
      emit(ErrorSearchPokemonState(e.message));
    } catch (e) {
      emit(ErrorSearchPokemonState("Aconteceu algo inesperado"));
    }
  }

  Future<void> _getPokemonByNumber(String pokemonNumber) async {
    try {
      emit(LoadingSearchPokemon());

      final result = await _getPokemonUsecase(
        numberPokemon: pokemonNumber,
        filterTypeEntity: filterTypeEntity,
      );

      if (result.isError) throw result.error!;

      _savePokemonInHistory(result.value!);

      pokemonSearch = result.value!;

      emit(LoadedPokemonState(result.value!));
    } on GetPokemonError catch (e) {
      emit(ErrorSearchPokemonState(e.message));
    } catch (e) {
      emit(ErrorSearchPokemonState("Aconteceu algo inesperado"));
    }
  }

  Future<void> readPokemonsHistory() async {
    try {
      emit(LoadingMostSearch());

      final result = await _readSearchedPokemonHistoryUseCase();

      if (result.isError) throw result.error!;

      emit(LoadedMostSearch());
      pokemonsInHistory = result.value!;
    } on ReadPokemonHistoryError catch (e) {
      emit(ErrorMostSearch(e.message));
    } catch (e) {
      emit(ErrorMostSearch("Aconteceu algo inesperado"));
    }
  }
}
