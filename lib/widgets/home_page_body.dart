import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import '../pages/pokemon_page.dart';
import '../utils/ui_constants.dart';
import 'custom_image_network.dart';




class HomePageBody extends StatelessWidget {
  final List<Pokemon> listOfPokemons;

  const HomePageBody({
    Key? key,
    required this.listOfPokemons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        listOfPokemons.length,
        (index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PokemonPage(
                    pokemon: listOfPokemons[index],
                  ),
                ),
              );
            },
            leading: CustomImageNetwork(
              imagePath: listOfPokemons[index].sprites.frontDefault,
            ),
            title: Text(
              listOfPokemons[index].name,
            ),
            subtitle: Text(
              UiConstant.heightText +
                  listOfPokemons[index].height.toString() +
                  UiConstant.weightText +
                  listOfPokemons[index].weight.toString() +
                  UiConstant.experienceText +
                  listOfPokemons[index].baseExperience.toString(),
            ),
          );
        },
      ),
    );
  }
}
