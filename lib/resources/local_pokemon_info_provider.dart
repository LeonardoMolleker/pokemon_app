import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalPokemonInfoProvider {
  Future<Database> openDB() async {
    return openDatabase(join(await getDatabasesPath(), "pokemon_database.db"),
        onCreate: (db, version) {
      return db.execute(

            ,
      );
    }, version: 1);
  }
}
