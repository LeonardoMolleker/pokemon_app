import 'named_api_resource.dart';

class PokemonType {
  int slot;
  NamedApiResource type;

  PokemonType({
    required this.slot,
    required this.type,
  });

  factory PokemonType.fromJSON(
    Map<String, dynamic> json,
  ) {
    return PokemonType(
      slot: json["slot"],
      type: NamedApiResource.fromJSON(
        json["type"],
      ),
    );
  }
}
