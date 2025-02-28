import 'package:multiple_result/src/result.dart';
import 'package:pokedexapp/shared/base/base_use_case.dart';
import 'package:pokedexapp/shared/modules/pokemon/dominio/entidades/entidad_pokemon.dart';
import 'package:pokedexapp/shared/modules/pokemon/dominio/repositorios/i_repositorio_pokemon.dart';


class UCPokemonGetData extends BaseUseCase<int, EntidadPokemon>{
  final IRepositorioPokemon _repo;

  UCPokemonGetData(this._repo);

  @override
  Future<Result<EntidadPokemon, String>> call(int id) {
    return _repo.getPokemonID(id);
  }
}