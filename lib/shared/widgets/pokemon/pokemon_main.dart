import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokedexapp/config/constants/const_name_router.dart';
import 'package:pokedexapp/config/db/db_pokedex.dart';
import 'package:pokedexapp/config/services/service_navigation.dart';
import 'package:pokedexapp/shared/modules/pokemon/dominio/entidades/entidad_pokemon.dart';
import 'package:pokedexapp/shared/widgets/pokemon/pokemon_status.dart';

import '../../../config/constants/colors_pokemon.dart';
import '../../../config/theme/app_colors.dart';
import '../../../modules/details/screen_details.dart';

class PokemonMain extends StatefulWidget {
  const PokemonMain({
    super.key,
    required this.pokemon,
    required this.idPokemon,
    required this.factorChange,
  });

  final EntidadPokemon pokemon;
  final int idPokemon;
  final double? factorChange;

  @override
  State<PokemonMain> createState() => _PokemonMainState();
}

class _PokemonMainState extends State<PokemonMain> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _toggleFavorite() async {
    if (isFavorite) {
      DBPokedex.db.deletePokemon(widget.idPokemon);
    } else {
      DBPokedex.db.insertPokemonFavorite(widget.idPokemon, widget.pokemon);
    }

    // Actualizar estado
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void _openDetail(BuildContext context, EntidadPokemon pokemon) {
    Navigator.push(
      context,
      PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: PokemonDetails(pokemon: pokemon),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final separation = size.height * .57;
    final bottom = size.height * 0.13;

    return OverflowBox(
      alignment: Alignment.topCenter,
      maxHeight: size.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: getPokemonColor(widget.pokemon.types.first),
            ),
          ),
          Positioned.fill(
            top: separation,
            bottom: bottom,
            child: Center(
              child: Container(
                width: size.width * .74,
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: Column(
                  children: [
                    SizedBox(height: size.height * .07),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 10,
                      children: [
                        PokemonStatus(
                          statName: 'Attack',
                          statValue:
                              widget.pokemon.stats['attack']?.toString() ?? '0',
                          color: getPokemonColor(widget.pokemon.types.first),
                          isStatName: true,
                        ),
                        PokemonStatus(
                          statName: 'Defense',
                          statValue:
                              widget.pokemon.stats['defense']?.toString() ??
                              '0',
                          isStatName: true,
                          color: getPokemonColor(widget.pokemon.types.first),
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
                          statValue:
                              widget.pokemon.stats['hp']?.toString() ?? '0',
                          isStatName: true,
                          color: getPokemonColor(widget.pokemon.types.first),
                        ),
                        PokemonStatus(
                          statName: '',
                          statValue:
                              'Type: ${capitalizeFirstLetter(widget.pokemon.types.first)}',
                          isStatName: false,
                          color: getPokemonColor(widget.pokemon.types.first),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => _openDetail(context, widget.pokemon),
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
          ),
          Positioned(
            left: 20,
            right: 20,
            top: separation * 0.5,
            bottom: size.height * .35,
            child: Opacity(
              opacity: 1.0 - widget.factorChange!,
              child: Transform.scale(
                scale: lerpDouble(1, .4, widget.factorChange!),
                child: Hero(
                  tag: widget.pokemon.imageUrl,
                  child: Image.network(widget.pokemon.imageUrl),
                ),
              ),
            ),
          ),
          Positioned(
            left: 40,
            right: 40,
            top: size.height * .05,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 7,
                  children: [
                    GestureDetector(
                      onTap:
                          () => ServiceNavigation.replace(
                            ConstNameRouter.favorites,
                          ),
                      child: Text(
                        "Mis Favoritos",
                        style: Theme.of(
                          context,
                        ).textTheme.labelMedium?.copyWith(fontSize: 16),
                      ),
                    ),
                    FutureBuilder<bool>(
                      future: DBPokedex.db.checkIfFavorite(widget.idPokemon),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator(); // Mientras carga
                        }
                        bool isFavorite = snapshot.data ?? false;
                        return GestureDetector(
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.yellow : Colors.white,
                          ),
                          onTap: () async {
                            if (isFavorite) {
                              await DBPokedex.db.deletePokemon(
                                widget.idPokemon,
                              );
                            } else {
                              await DBPokedex.db.insertPokemonFavorite(
                                widget.idPokemon,
                                widget.pokemon,
                              );
                            }
                            setState(() {}); // Vuelve a construir el widget
                          },
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.07),
                Text(
                  "Pokemon nro ${widget.idPokemon}",
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium?.copyWith(fontSize: 16),
                ),
                Hero(
                  tag: widget.pokemon.name,
                  child: Text(
                    capitalizeFirstLetter(widget.pokemon.name),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
}
