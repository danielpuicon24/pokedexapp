
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedexapp/shared/modules/pokemon/dominio/entidades/entidad_pokemon.dart';
import 'package:pokedexapp/shared/modules/pokemon/dominio/use_case/uc_pokemon_get_data.dart';
import 'package:pokedexapp/shared/modules/pokemon/infraestructura/datasource/datasource_pokemon.dart';
import 'package:pokedexapp/shared/modules/pokemon/infraestructura/repositories/repositorio_pokemon.dart';

import '../../../../config/constants/enum.dart';
import '../../../base/base_provider.dart';

class ProviderPokemon extends ChangeNotifier with BaseProvider {
  EnumStatusDataLoading status = EnumStatusDataLoading.loading;

  EntidadPokemon objPokemon = EntidadPokemon();


  final UCPokemonGetData _ucGetDataPokemon = UCPokemonGetData(
    RepositorioPokemon(
      DatasourcePokemon(),
    ),
  );

  Future getData(int id) async {
    final result = await _ucGetDataPokemon.call(id);

    if (result.isError()) {
      throw Exception(result.tryGetError() ?? "");
    }

    objPokemon = result.tryGetSuccess()!;
    status = EnumStatusDataLoading.finish;
    notifyListeners();
  }
}
