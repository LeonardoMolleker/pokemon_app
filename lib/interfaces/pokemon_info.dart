import '../models/pokemon.dart';

import 'bloc.dart';

abstract class IPokemonInfo extends Bloc {
  void getPageOfPokemons(
    String limit,
    String offset,
  );

  Stream<List<Pokemon>> get streamOfPokemons;
}
