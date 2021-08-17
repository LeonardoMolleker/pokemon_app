import '../models/named_api_resource.dart';
import '../models/pokemon.dart';

abstract class IPokemonInfoProvider {
  Future<List<Pokemon>> getListOfPokemonInfo(
    String limit,
    String offset,
  );
}
