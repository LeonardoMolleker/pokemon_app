import 'package:pokemon_app/models/named_api_resource.dart';

class NamedApiResourceList {
  int count;
  String? next;
  String? previous;
  List<NamedApiResource> pokemons;

  NamedApiResourceList({
    required this.count,
    this.next,
    this.previous,
    required this.pokemons,
  });

  factory NamedApiResourceList.fromJson(
    Map<String, dynamic> json,
  ) {
    List<NamedApiResource> temporalPokemons = [];
    json["results"].forEach((element) {
      temporalPokemons.add(
        NamedApiResource.fromJSON(
          element,
        ),
      );
    });
    return NamedApiResourceList(
      count: json["count"],
      next: json["next"],
      previous: json["previous"],
      pokemons: temporalPokemons,
    );
  }
}
