import '../models/named_api_resource_list.dart';
import '../models/named_api_resource.dart';
import '../models/pokemon_ability.dart';
import '../models/pokemon_move.dart';
import '../models/pokemon_sprites.dart';
import '../models/pokemon_stat.dart';
import '../models/pokemon_type.dart';

abstract class DefaultValues {
  static const int defaultIntValue = 0;
  static const int defaultPage = 1;
  static const String defaultStringValue = "";
  static const bool defaultBoolValue = false;
  static const List<PokemonAbility> defaultPokemonAbilityList = [];
  static const List<NamedApiResource> defaultNamedApiResourceList = [];
  static const List<PokemonMove> defaultPokemonMoveList = [];
  static final PokemonSprites defaultPokemonSprites = PokemonSprites();
  static const List<PokemonStat> defaultPokemonStatList = [];
  static const List<PokemonType> defaultPokemonTypeList = [];
  static final NamedApiResource defaultNamedApiResource = NamedApiResource(
    name: defaultStringValue,
    url: defaultStringValue,
  );
  static final NamedApiResourceList defaultNamedApiResourceListClass =
      NamedApiResourceList(
    count: defaultIntValue,
    pokemons: defaultNamedApiResourceList,
  );
  static const String defaultOffset = "0";
  static const String defaultLimit = "5";
  static const String defaultPathImage = "assets/no_image_available.jpg";
}
