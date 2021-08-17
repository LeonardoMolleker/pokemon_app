class PokemonSprites {
  String? frontDefault;
  String? frontShiny;
  String? frontFemale;
  String? frontShinyFemale;
  String? backDefault;
  String? backShiny;
  String? backFemale;
  String? backShinyFemale;

  PokemonSprites({
    this.frontDefault,
    this.frontShiny,
    this.frontFemale,
    this.frontShinyFemale,
    this.backDefault,
    this.backShiny,
    this.backFemale,
    this.backShinyFemale,
  });

  factory PokemonSprites.fromJSON(Map<String, dynamic> json) {
    return PokemonSprites(
      frontDefault: json["front_default"],
      frontShiny: json["front_shiny"],
      frontFemale: json["front_female"],
      frontShinyFemale: json["front_shiny_female"],
      backDefault: json["back_default"],
      backShiny: json["back_shiny"],
      backFemale: json["back_female"],
      backShinyFemale: json["back_shiny_female"],
    );
  }
}
