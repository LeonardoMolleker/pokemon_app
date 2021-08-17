import 'dart:async';
import '../interfaces/pokemon_info_repository.dart';
import '../models/pokemon.dart';
import '../resources/pokemon_info_repository.dart';
import '../interfaces/pokemon_info.dart';

class PokemonInfo extends IPokemonInfo {
  IPokemonInfoRepository _pokemonInfoRepository = PokemonInfoRepository();
  StreamController<List<Pokemon>> _streamControllerPokemons =
      StreamController();

  Stream<List<Pokemon>> get streamOfPokemons =>
      _streamControllerPokemons.stream;

  @override
  Future<void> initialize() async {
    return;
  }

  @override
  void getPageOfPokemons(
    String limit,
    String offset,
  ) async {
    List<Pokemon> _pokemonsInfo =
        await _pokemonInfoRepository.getListOfPokemonInfo(
      limit,
      offset,
    );
    _streamControllerPokemons.sink.add(
      _pokemonsInfo,
    );
  }

  @override
  void dispose() {
    _streamControllerPokemons.close();
    return;
  }
}
