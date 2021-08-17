import 'named_api_resource.dart';

class PokemonMoveVersion {
  NamedApiResource moveLearnMethod;
  NamedApiResource versionGroup;
  int levelLearnedAt;

  PokemonMoveVersion({
    required this.moveLearnMethod,
    required this.versionGroup,
    required this.levelLearnedAt,
  });

  factory PokemonMoveVersion.fromJSON(Map<String, dynamic> json) {
    return PokemonMoveVersion(
      moveLearnMethod: NamedApiResource.fromJSON(
        json["move_learn_method"],
      ),
      versionGroup: NamedApiResource.fromJSON(
        json["version_group"],
      ),
      levelLearnedAt: json["level_learned_at"],
    );
  }
}
