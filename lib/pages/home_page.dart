import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/firebase_bloc.dart';
import '../interfaces/firebase.dart';
import '../interfaces/pokemon_info.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/home_page_body.dart';
import '../providers/pagination_provider.dart';
import '../bloc/pokemon_info_bloc.dart';
import '../models/pokemon.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late IFirebase firebaseBloc;
  late PaginationProvider paginationProvider;
  late IPokemonInfo pokemonInfo;
  List<Pokemon> listOfPokemonsInfo = [];

  @override
  void initState() {
    super.initState();
    firebaseBloc = context.read<FirebaseBloc>();
    paginationProvider = context.read<PaginationProvider>();
    pokemonInfo = context.read<PokemonInfo>();
    firebaseBloc.initialize();
    pokemonInfo.streamOfPokemons.listen(
      (event) {
        listOfPokemonsInfo = event;
        setState(() {});
      },
    );
    pokemonInfo.getPageOfPokemons(
      paginationProvider.limit,
      paginationProvider.offset,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageBody(
        listOfPokemons: listOfPokemonsInfo,
      ),
      bottomNavigationBar: Consumer<PaginationProvider>(
        builder: (context, paginationProvider, _) => CustomBottomNavigationBar(
          onPressedLeftButton: () {
            changePage(
              PageEvent.PREVIOUS,
              paginationProvider,
              context,
            );
          },
          onPressedRightButton: () {
            changePage(
              PageEvent.NEXT,
              paginationProvider,
              context,
            );
          },
          middleText: paginationProvider.page.toString(),
          rightButtonChild: Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          leftButtonChild: Icon(
            Icons.arrow_back_ios_outlined,
          ),
          disabledConditionLeftButton: !paginationProvider.hasPreviousPage(),
          disabledConditionRightButton: !paginationProvider.hasNextPage(),
        ),
      ),
    );
  }

  void changePage(
    PageEvent event,
    PaginationProvider provider,
    BuildContext context,
  ) {
    provider.changePage(event);
    pokemonInfo.getPageOfPokemons(
      provider.limit,
      provider.offset,
    );
  }
}
