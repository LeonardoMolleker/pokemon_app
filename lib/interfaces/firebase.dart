import 'package:cloud_firestore/cloud_firestore.dart';
import 'bloc.dart';
import '../models/pokemon.dart';
import '../models/simplified_pokemon.dart';

abstract class IFirebase extends Bloc{
  Future<void> initialize();
  void dispose();
  FirebaseFirestore get firestoreInstance;
  CollectionReference get pokemonCollection;
  Future<void> addPokemon(Pokemon pokemon);
  Future<List<SimplifiedPokemon>> getPokemons();
  Future<void> deletePokemons(String id);
}