import 'package:flutter/material.dart';
import 'package:pokemon_app/bloc/firebase_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/pokemon_info_bloc.dart';
import 'pages/home_page.dart';
import 'providers/pagination_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => PokemonInfo(),
        ),
        ChangeNotifierProvider(
          create: (context) => PaginationProvider(),
        ),
        Provider(
          create: (context) => FirebaseBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
