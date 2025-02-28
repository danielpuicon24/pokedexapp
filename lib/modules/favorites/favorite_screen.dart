import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedexapp/config/constants/colors_pokemon.dart';
import 'package:pokedexapp/config/constants/const_name_router.dart';
import 'package:pokedexapp/config/services/service_navigation.dart';
import 'package:pokedexapp/config/theme/app_colors.dart';

import '../../config/db/db_pokedex.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  showAlertDelete(
      BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Quitar Favorito",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 6.0,
              ),
              Text(
                "¿Estás seguro de eliminar de la lista de tus favoritos?",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w300, color: Colors.black,),
              ),
              const SizedBox(
                height: 6.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      ServiceNavigation.goBack();
                    },
                    child: Text(
                      "Cancelar",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w400, color: Colors.black,),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      await DBPokedex.db.deletePokemon(id);
                      ServiceNavigation.goBack();
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      "Aceptar",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: ()=> ServiceNavigation.replace(ConstNameRouter.root),
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: AppColors.textPrimaryColor,
                    size: 40,
                  ),
                ),
                Text(
                  "Mis favoritos",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: Colors.black),
                ),
              ],
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: DBPokedex.db.getPokemonesFavourites(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
            
                if (snapshot.hasError) {
                  return Center(child: Text("Error al cargar favoritos"));
                }
            
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No hay Pokémon favoritos"));
                }
            
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final pokemon = snapshot.data![index];
                              
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: getPokemonColor(pokemon['Tipo']),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Row(
                            children: [
                              Hero(
                                tag: "pokemon_${pokemon['IdPokemon']}",
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.network(
                                    pokemon['Imagen'],
                                    errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  capitalizeFirstLetter(pokemon['Nombre']),
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                                ),
                              ),
                              InkWell(
                                onTap: ()=> showAlertDelete(context, pokemon['IdPokemon']),
                                child: SvgPicture.asset(
                                  "assets/icons/icon_delete.svg",
                                  width: 30,
                                  height: 30,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
}
