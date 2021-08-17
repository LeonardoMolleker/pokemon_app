abstract class SqfliteTable{
  static const pokemonTable = 'CREATE TABLE pokemon(id INTEGER PRIMARY KEY, name TEXT, height INTEGER,'
      ' weight INTEGER, base_experience INTEGER, is_default BOOLEAN, order INTEGER,'
      ' location_area_encounter TEXT)';

  static const abilityTable = 'CREATE TABLE ability(id INTEGER PRIMARY KEY, id_pokemon FOREIGN KEY, is_hidden BOOLEAN,'
      'slot INTEGER)';
  static const namedApiResourceTable = "CREATE TABLE named_api_resource(id INTEGER PRIMARY KEY, id_pokemon FOREIGN KEY, name TEXT, url TEXT, type INTEGER)";
  static const moveTable = "CREATE TABLE move(id INTEGER PRIMARY KEY, )"
}