import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokedexapp/config/theme/app_colors.dart';
import 'package:pokedexapp/shared/modules/pokemon/dominio/entidades/entidad_pokemon.dart';
import 'package:pokedexapp/shared/widgets/pokemon/pokemon_status.dart';

import '../../../config/constants/colors_pokemon.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
    required this.factorChange,
    required this.idPokemon,
  });

  final EntidadPokemon pokemon;
  final int idPokemon;
  final double? factorChange;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return OverflowBox(
      alignment: Alignment.topCenter,
      maxHeight: size.height,
      child: Container(
        color: getPokemonColor(pokemon.types.first),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 7,
                children: [
                  Text(
                    "Mis Favoritos",
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium?.copyWith(fontSize: 16),
                  ),
                  Icon(
                    Icons.favorite_outline_rounded,
                    size: 30,
                    color: AppColors.white,
                  ),
                ],
              ),
              Text(
                "Pokemon nro $idPokemon",
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(fontSize: 16),
              ),
              Hero(
                tag: pokemon.name,
                child: Text(
                  capitalizeFirstLetter(pokemon.name),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Opacity(
                opacity: 1.0 - factorChange!,
                child: Transform.scale(
                  scale: lerpDouble(1, .4, factorChange!),
                  child: Hero(
                    tag: pokemon.imageUrl,
                    child: Image.network(pokemon.imageUrl),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: size.width * .74,
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: size.height * .15,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 10,
                        children: [
                          PokemonStatus(
                            statName: 'Attack',
                            statValue: pokemon.stats['attack']?.toString() ?? '0',
                            color: getPokemonColor(pokemon.types.first), isStatName: true,
                          ),
                          PokemonStatus(
                            statName: 'Defense',
                            statValue: pokemon.stats['defense']?.toString() ?? '0',
                            isStatName: true,
                            color: getPokemonColor(pokemon.types.first),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 10,
                        children: [
                          PokemonStatus(
                            statName: 'HP',
                            statValue: pokemon.stats['hp']?.toString() ?? '0',
                            isStatName: true,
                            color: getPokemonColor(pokemon.types.first),
                          ),
                          PokemonStatus(
                            statName: '',
                            statValue: 'Type: ${capitalizeFirstLetter(pokemon.types.first)}',
                            isStatName: false,
                            color: getPokemonColor(pokemon.types.first),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: AppColors.textPrimaryColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            "Yo te elijo!",
                            style: Theme.of(
                              context,
                            ).textTheme.labelLarge?.copyWith(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
}
