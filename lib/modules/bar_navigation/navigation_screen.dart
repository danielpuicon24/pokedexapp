import 'package:pokedexapp/modules/bar_navigation/provider_navigation.dart';
import 'package:pokedexapp/modules/home/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../favorites/favorite_screen.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  static final List<Widget> _pages = <Widget>[
    ScreenHome(),
    FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Accedemos al provider
    final navProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: _pages[navProvider.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navProvider.selectedIndex,
        onTap: (index) {
          navProvider.selectedIndex = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
