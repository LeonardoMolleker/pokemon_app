import 'pokemon_move.dart';
import 'pokemon_sprites.dart';
import 'pokemon_stat.dart';
import 'pokemon_type.dart';
import 'named_api_resource.dart';
import 'pokemon_ability.dart';

class Pokemon {
  int id;
  String name;
  int height;
  int weight;
  int baseExperience;
  bool isDefault;
  int order;
  String locationAreaEncounters;
  List<PokemonAbility> abilities;
  List<NamedApiResource> forms;
  List<PokemonMove> moves;
  PokemonSprites sprites;
  NamedApiResource species;
  List<PokemonStat> stats;
  List<PokemonType> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.baseExperience,
    required this.isDefault,
    required this.order,
    required this.locationAreaEncounters,
    required this.abilities,
    required this.forms,
    required this.moves,
    required this.sprites,
    required this.species,
    required this.stats,
    required this.types,
  });

  factory Pokemon.fromJSON(
    Map<String, dynamic> json,
  ) {
    List<PokemonAbility> temporalAbilities = [];
    json["abilities"].forEach((element) {
      temporalAbilities.add(
        PokemonAbility.fromJSON(
          element,
        ),
      );
    });

    List<NamedApiResource> temporalForms = [];
    json["forms"].forEach((element) {
      temporalForms.add(
        NamedApiResource.fromJSON(
          element,
        ),
      );
    });

    List<PokemonMove> temporalMoves = [];
    json["moves"].forEach((element) {
      temporalMoves.add(
        PokemonMove.fromJSON(
          element,
        ),
      );
    });

    PokemonSprites temporalSprites = PokemonSprites.fromJSON(
      json["sprites"],
    );

    NamedApiResource temporalSpecies = NamedApiResource.fromJSON(
      json["species"],
    );

    List<PokemonStat> temporalStats = [];
    json["stats"].forEach((element) {
      temporalStats.add(
        PokemonStat.fromJSON(
          element,
        ),
      );
    });

    List<PokemonType> temporalTypes = [];
    json["types"].forEach((element) {
      temporalTypes.add(
        PokemonType.fromJSON(
          element,
        ),
      );
    });

    return Pokemon(
      id: json["id"],
      name: json["name"],
      height: json["height"],
      weight: json["weight"],
      baseExperience: json["base_experience"],
      isDefault: json["is_default"],
      order: json["order"],
      locationAreaEncounters: json["location_area_encounters"],
      abilities: temporalAbilities,
      forms: temporalForms,
      moves: temporalMoves,
      sprites: temporalSprites,
      species: temporalSpecies,
      stats: temporalStats,
      types: temporalTypes,
    );
  }
}
