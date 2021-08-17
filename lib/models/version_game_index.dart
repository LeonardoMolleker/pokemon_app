import 'named_api_resource.dart';

class VersionGameIndex {
  int gameIndex;
  NamedApiResource version;

  VersionGameIndex({
    required this.gameIndex,
    required this.version,
  });

  factory VersionGameIndex.fromJSON(
    Map<String, dynamic> json,
  ) {
    return VersionGameIndex(
      gameIndex: json["game_index"],
      version: NamedApiResource.fromJSON(
        json["version"],
      ),
    );
  }
}
