import 'package:flutter/material.dart';
import 'package:pokedexapp/shared/modules/pokemon/provider/provider_pokemon.dart';
import 'package:provider/provider.dart';

import 'config/router/app_router.dart';
import 'config/services/service_navigation.dart';
import 'config/theme/app_theme.dart';
import 'modules/bar_navigation/provider_navigation.dart';

void main() {
  runApp(const MyApp());
}

final appTheme = AppTheme();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => ProviderPokemon()),
        ChangeNotifierProvider(lazy: false, create: (_) => NavigationProvider()),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: appTheme.getLight(),
        builder: (context, child) {
          return Overlay(
            initialEntries: [
              OverlayEntry(builder: (context) {
                return Container(
                  key: ServiceNavigation.globalKey,
                  child: child,
                );
              })
            ],
          );
        },
      ),
    );
  }
}
