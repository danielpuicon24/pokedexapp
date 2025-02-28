import 'package:multiple_result/src/result.dart';
import 'package:pokedexapp/shared/modules/pokemon/dominio/datasource/i_datasource_pokemon.dart';
import 'package:pokedexapp/shared/modules/pokemon/dominio/entidades/entidad_pokemon.dart';
import 'package:pokedexapp/shared/modules/pokemon/dominio/repositorios/i_repositorio_pokemon.dart';

class RepositorioPokemon implements IRepositorioPokemon{
  final IDatasourcePokemon _datasource;

  RepositorioPokemon(this._datasource);

  @override
  Future<Result<EntidadPokemon, String>> getPokemonID(int id) {
    return _datasource.getPokemonID(id);
  }

}