import 'named_api_resource.dart';
import 'pokemon_held_item_version.dart';

class PokemonHeldItem {
  NamedApiResource item;
  PokemonHeldItemVersion versionDetails;

  PokemonHeldItem({
    required this.item,
    required this.versionDetails,
  });

  factory PokemonHeldItem.fromJSON(
    Map<String, dynamic> json,
  ) {
    return PokemonHeldItem(
      item: json["item"],
      versionDetails: json["version_details"],
    );
  }
}
