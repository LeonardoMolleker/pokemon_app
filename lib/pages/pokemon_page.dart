import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/firebase_bloc.dart';
import '../widgets/custom_image_network.dart';
import '../models/pokemon.dart';
import '../utils/ui_constants.dart';
import '../widgets/custom_expansion_panel.dart';

class PokemonPage extends StatelessWidget {
  final Pokemon pokemon;

  PokemonPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageNetwork(
              imagePath: pokemon.sprites.frontDefault,
            ),
            Text(
              pokemon.name,
            ),
            CustomExpansionPanel(
              data: List<String>.generate(
                pokemon.abilities.length,
                (index) {
                  return pokemon.abilities[index].ability.name;
                },
              ),
              title: UiConstant.abilitiesText,
            ),
            CustomExpansionPanel(
              data: List<String>.generate(
                pokemon.forms.length,
                (index) {
                  return pokemon.forms[index].name;
                },
              ),
              title: UiConstant.formsText,
            ),
            CustomExpansionPanel(
              data: List<String>.generate(
                pokemon.moves.length,
                (index) {
                  return pokemon.moves[index].move.name;
                },
              ),
              title: UiConstant.movesText,
            ),
            CustomExpansionPanel(
              data: List<String>.generate(
                pokemon.stats.length,
                (index) {
                  return pokemon.stats[index].stat.name;
                },
              ),
              title: UiConstant.statsText,
            ),
            CustomExpansionPanel(
              data: List<String>.generate(
                pokemon.types.length,
                (index) {
                  return pokemon.types[index].type.name;
                },
              ),
              title: UiConstant.typesText,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(shape: CircleBorder()),
              onPressed: () {
                Provider.of<FirebaseBloc>(context, listen: false).addPokemon(
                  pokemon,
                );
              },
              child: Icon(
                Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
