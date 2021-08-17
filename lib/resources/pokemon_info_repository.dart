import '../interfaces/pokemon_info_provider.dart';
import '../models/pokemon.dart';
import 'pokemon_info_provider.dart';
import '../interfaces/pokemon_info_repository.dart';

class PokemonInfoRepository extends IPokemonInfoRepository {
  IPokemonInfoProvider _pokemonInfoProvider = PokemonInfoProvider();

  @override
  Future<List<Pokemon>> getListOfPokemonInfo(
    String limit,
    String offset,
  ) {
    return _pokemonInfoProvider.getListOfPokemonInfo(
      limit,
      offset,
    );
  }
}
