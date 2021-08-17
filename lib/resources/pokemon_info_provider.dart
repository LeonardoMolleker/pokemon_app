import 'dart:convert';
import 'package:http/http.dart';
import '../interfaces/pokemon_info_provider.dart';
import '../utils/default_values.dart';
import '../utils/network_constants.dart';
import '../models/pokemon.dart';

class PokemonInfoProvider extends IPokemonInfoProvider {
  Client client = Client();

  Future<List<Pokemon>> getListOfPokemonInfo(
    String limit,
    String offset,
  ) async {
    List<Pokemon> pokemonList = [];
    int index = int.parse(offset) + 1;
    int limitAsInt = int.parse(limit);
    int offsetAsInt = int.parse(offset);
    for (int i = index; i <= offsetAsInt + limitAsInt; i++) {
      pokemonList.add(
        await getPokemonParsed(
          i.toString(),
        ),
      );
    }
    return pokemonList;
  }

  Future<Pokemon> getPokemonParsed(
    String id,
  ) async {
    Response pokemon = await client.get(
      Uri.parse(
        NetworkConstants.basePokemonUrl + id,
      ),
    );
    if (pokemon.statusCode == NetworkConstants.statusCodeOk) {
      return Pokemon.fromJSON(
        json.decode(
          pokemon.body,
        ),
      );
    }
    return Pokemon(
      id: DefaultValues.defaultIntValue,
      name: DefaultValues.defaultStringValue,
      height: DefaultValues.defaultIntValue,
      weight: DefaultValues.defaultIntValue,
      baseExperience: DefaultValues.defaultIntValue,
      isDefault: DefaultValues.defaultBoolValue,
      order: DefaultValues.defaultIntValue,
      locationAreaEncounters: DefaultValues.defaultStringValue,
      abilities: DefaultValues.defaultPokemonAbilityList,
      forms: DefaultValues.defaultNamedApiResourceList,
      moves: DefaultValues.defaultPokemonMoveList,
      sprites: DefaultValues.defaultPokemonSprites,
      species: DefaultValues.defaultNamedApiResource,
      stats: DefaultValues.defaultPokemonStatList,
      types: DefaultValues.defaultPokemonTypeList,
    );
  }
}
