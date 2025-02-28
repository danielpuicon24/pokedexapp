import 'package:multiple_result/src/result.dart';
import 'package:pokedexapp/config/api/pokemon/api.dart';
import 'package:pokedexapp/shared/modules/pokemon/dominio/datasource/i_datasource_pokemon.dart';
import 'package:pokedexapp/shared/modules/pokemon/dominio/entidades/entidad_pokemon.dart';

class DatasourcePokemon implements IDatasourcePokemon {
  @override
  Future<Result<EntidadPokemon, String>> getPokemonID(int id) async {
    try {
      final dio = await ApiPokemon.dio();

      final response = await dio.get("$id/");

      final result = ApiPokemon.handle(
        response,
            (json) => EntidadPokemon.fromMap(json),
      );

      return result;
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
