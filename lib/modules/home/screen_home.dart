import 'package:flutter/material.dart';
import 'package:pokedexapp/modules/home/provider_home.dart';
import 'package:pokedexapp/shared/modules/pokemon/provider/provider_pokemon.dart';
import 'package:pokedexapp/shared/widgets/pokemon/pokemon_card.dart';
import 'package:provider/provider.dart';

import '../../config/constants/colors_pokemon.dart';
import '../../config/constants/enum.dart';
import '../../shared/widgets/loading/custom_input_loading_input.dart';
import '../../shared/widgets/pokemon/pokemon_main.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderPokemon providerPokemon =
    Provider.of<ProviderPokemon>(context);
    ProviderHome provider = ProviderHome(providerPokemon: providerPokemon);
    return ChangeNotifierProvider.value(
        value: provider,
        builder: (context, _) {
          return Consumer<ProviderHome>(builder: (context, provider, value) {
            return _HomeMenu(
              provider: provider,
            );
          });
        });
  }
}

class _HomeMenu extends StatefulWidget {
  final ProviderHome provider;
  const _HomeMenu({required this.provider});

  @override
  State<_HomeMenu> createState() => __HomeMenuState();
}

class __HomeMenuState extends State<_HomeMenu> {
  int currentPokemonId = 1;
  double? _percent;

  @override
  void initState() {
    super.initState();
    widget.provider.getDataPokemon(currentPokemonId);
    _percent = 0.0;
  }

  void loadNextPokemon() {
    setState(() {
      currentPokemonId++;
      widget.provider.getDataPokemon(currentPokemonId);
    });
  }

  void loadPreviousPokemon() {
    setState(() {
      if(currentPokemonId > 1){
        currentPokemonId--;
        widget.provider.getDataPokemon(currentPokemonId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProviderHome>(
        builder: (context, provider, child) {
          final pokemon = provider.pokemon;

          if (provider.providerPokemon.status ==
              EnumStatusDataLoading.loading) {
            return Center(child: CustomInputLoadingInput(size: 50,));
          }
          if (provider.providerPokemon.status ==
              EnumStatusDataLoading.finish &&
              pokemon.name == "") {
            return Center(
                child: Text("No hay información del pokemon"));
          }

          return GestureDetector(
            onVerticalDragEnd: (details) {
              if (details.primaryVelocity != null) {
                if (details.primaryVelocity! < 0) {
                  loadNextPokemon();
                } else if (details.primaryVelocity! > 0) {
                  loadPreviousPokemon();
                }
              }
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (widget, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: widget,
                );
              },
              child:  PokemonMain(pokemon: pokemon, factorChange: _percent, idPokemon: currentPokemonId,),

            ),
          );
        },
      ),
    );
  }
}