import 'package:flutter/material.dart';

Map<String, Color> typeColors = {
  "fire": Colors.red,
  "water": Colors.blue,
  "grass": Colors.green,
  "electric": Colors.yellow,
  "psychic": Colors.purple,
  "ice": Colors.cyan,
  "fighting": Colors.orange,
  "poison": Colors.purple[800]!,
  "ground": Colors.brown,
  "flying": Colors.lightBlueAccent,
  "bug": Colors.lightGreen,
  "rock": Colors.grey,
  "ghost": Colors.indigo,
  "dragon": Colors.indigoAccent,
  "dark": Colors.black54,
  "steel": Colors.blueGrey,
  "fairy": Colors.pink,
  "normal": Colors.grey[400]!,
};

Color getPokemonColor(String type) {
  return typeColors[type] ?? Colors.grey;
}
