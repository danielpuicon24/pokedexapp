
import 'package:multiple_result/multiple_result.dart';
import 'package:pokedexapp/shared/modules/pokemon/dominio/entidades/entidad_pokemon.dart';


abstract class IRepositorioPokemon {
  Future<Result<EntidadPokemon, String>> getPokemonID(int id);
}
