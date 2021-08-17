import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../models/simplified_pokemon.dart';
import '../interfaces/firebase.dart';
import '../models/pokemon.dart';

class FirebaseBloc extends IFirebase {
  factory FirebaseBloc() => _firebaseInitialization;

  FirebaseBloc._internal();

  static final FirebaseBloc _firebaseInitialization = FirebaseBloc._internal();

  @override
  void dispose() {
    return;
  }

  @override
  Future<void> initialize() async {
    try {
      await Firebase.initializeApp();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  FirebaseFirestore get firestoreInstance => FirebaseFirestore.instance;

  CollectionReference get pokemonCollection =>
      firestoreInstance.collection('pokemons');

  Future<void> addPokemon(Pokemon pokemon) async {
    pokemonCollection.add({
          "name": pokemon.name,
          "height": pokemon.height.toString(),
          "weight": pokemon.weight.toString(),
          "experience": pokemon.baseExperience.toString(),
        })
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<List<SimplifiedPokemon>> getPokemons() async{
    var data = await pokemonCollection.get();
    var dataIterator = data.docs.iterator;
    List<SimplifiedPokemon> pokemons = [];
    while(dataIterator.moveNext()){
      Map<String, dynamic> pokemonData = dataIterator.current.data() as Map<String, dynamic>;
      SimplifiedPokemon pokemon = SimplifiedPokemon.fromJSON(pokemonData);
      pokemon.id = dataIterator.current.id;
      pokemons.add(pokemon);
    }
    return pokemons;
  }

  Future<void> deletePokemons(String id) async{
    return pokemonCollection.doc(id).delete();
  }
}
