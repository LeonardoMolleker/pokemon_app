import 'named_api_resource.dart';
import 'pokemon_move_version.dart';

class PokemonMove {
  NamedApiResource move;
  List<PokemonMoveVersion> versionGroupDetails;

  PokemonMove({
    required this.move,
    required this.versionGroupDetails,
  });

  factory PokemonMove.fromJSON(
    Map<String, dynamic> json,
  ) {
    List<PokemonMoveVersion> temporalVersionGroupDetails = [];
    json["version_group_details"].forEach((
      element,
    ) {
      temporalVersionGroupDetails.add(
        PokemonMoveVersion.fromJSON(
          element,
        ),
      );
    });
    return PokemonMove(
      move: NamedApiResource.fromJSON(
        json["move"],
      ),
      versionGroupDetails: temporalVersionGroupDetails,
    );
  }
}
