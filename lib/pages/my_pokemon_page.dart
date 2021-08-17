import 'package:flutter/material.dart';
import 'package:pokemon_app/interfaces/firebase.dart';
import 'package:provider/provider.dart';

import '../bloc/firebase_bloc.dart';
import '../models/simplified_pokemon.dart';
import '../utils/default_values.dart';

class MyPokemonPage extends StatefulWidget {
  const MyPokemonPage({
    Key? key,
  }) : super(key: key);

  @override
  _MyPokemonPageState createState() => _MyPokemonPageState();
}

class _MyPokemonPageState extends State<MyPokemonPage> {
  List<SimplifiedPokemon> pokemons = [];
  late IFirebase firebaseBloc;

  @override
  void initState() {
    super.initState();
    firebaseBloc = context.read<FirebaseBloc>();
    firebaseBloc.getPokemons().then((value) {
      pokemons = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: List.generate(
          pokemons.length,
          (index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${pokemons[index].name} ",
                ),
                Text(
                  "${pokemons[index].height} ",
                ),
                Text(
                  "${pokemons[index].weight} ",
                ),
                Text(
                  "${pokemons[index].baseExperience} ",
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: CircleBorder()),
                  onPressed: () {
                    Provider.of<FirebaseBloc>(context, listen: false)
                        .deletePokemons(
                      pokemons[index].id.toString(),
                    );
                    pokemons.removeAt(index);
                    setState(() {});
                  },
                  child: Icon(
                    Icons.delete_forever,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
