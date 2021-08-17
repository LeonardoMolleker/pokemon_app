import 'named_api_resource.dart';

class PokemonStat {
  NamedApiResource stat;
  int effort;
  int baseStat;

  PokemonStat({
    required this.stat,
    required this.effort,
    required this.baseStat,
  });

  factory PokemonStat.fromJSON(
    Map<String, dynamic> json,
  ) {
    return PokemonStat(
      stat: NamedApiResource.fromJSON(
        json["stat"],
      ),
      effort: json["effort"],
      baseStat: json["base_stat"],
    );
  }
}
