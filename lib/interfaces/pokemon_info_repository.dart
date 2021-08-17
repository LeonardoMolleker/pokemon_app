import '../models/named_api_resource.dart';
import '../models/pokemon.dart';

abstract class IPokemonInfoRepository {
  Future<List<Pokemon>> getListOfPokemonInfo(
      String limit,
      String offset,
  );
}
