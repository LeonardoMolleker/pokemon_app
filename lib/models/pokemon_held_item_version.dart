import 'named_api_resource.dart';

class PokemonHeldItemVersion {
  NamedApiResource version;
  int rarity;

  PokemonHeldItemVersion({
    required this.version,
    required this.rarity,
  });

  factory PokemonHeldItemVersion.fromJSON(
    Map<String, dynamic> json,
  ) {
    return PokemonHeldItemVersion(
      version: NamedApiResource.fromJSON(
        json["version"],
      ),
      rarity: json["rarity"],
    );
  }
}
