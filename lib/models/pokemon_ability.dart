import 'named_api_resource.dart';

class PokemonAbility {
  bool isHidden;
  int slot;
  NamedApiResource ability;

  PokemonAbility({
    required this.isHidden,
    required this.slot,
    required this.ability,
  });

  factory PokemonAbility.fromJSON(
    Map<String, dynamic> json,
  ) {
    return PokemonAbility(
      isHidden: json["is_hidden"],
      slot: json["slot"],
      ability: NamedApiResource.fromJSON(json["ability"]),
    );
  }
}
