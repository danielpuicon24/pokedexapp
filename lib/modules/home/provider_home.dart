import 'package:pokedexapp/shared/modules/pokemon/dominio/entidades/entidad_pokemon.dart';
import 'package:pokedexapp/shared/modules/pokemon/provider/provider_pokemon.dart';
import 'package:flutter/material.dart';
import '../../shared/base/base_provider.dart';

class ProviderHome extends ChangeNotifier with BaseProvider {
  final ProviderPokemon providerPokemon;

  ProviderHome({required this.providerPokemon});

  EntidadPokemon get pokemon => providerPokemon.objPokemon;

  void getDataPokemon(int id) async {
    try {
      await providerPokemon.getData(id);
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}