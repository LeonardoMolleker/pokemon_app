class SimplifiedPokemon {
  String? id;
  String name;
  String height;
  String weight;
  String baseExperience;

  SimplifiedPokemon({
    this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.baseExperience,
  });

  factory SimplifiedPokemon.fromJSON(
      Map<String, dynamic> json,
      ) {
    return SimplifiedPokemon(
      name: json["name"],
      height: json["height"],
      weight: json["weight"],
      baseExperience: json["experience"],
    );
  }
}