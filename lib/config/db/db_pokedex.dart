import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokedexapp/shared/modules/pokemon/dominio/entidades/entidad_pokemon.dart';
import 'package:sqflite/sqflite.dart';

class DBPokedex {
  Database? _myBookDataBase;

  static final DBPokedex db = DBPokedex._();

  DBPokedex._();

  Future<Database?> getDatabase() async {
    if (_myBookDataBase != null) return _myBookDataBase;
    _myBookDataBase = await initDB();
    return _myBookDataBase;
  }

  Future<Database> initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, "Pokedex.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        try {
          print("Creando la tabla Favorito...");
          await db.execute(
            "CREATE TABLE Favorito ("
                "IdPokemon INTEGER PRIMARY KEY, "
                "Nombre TEXT, "
                "Imagen TEXT,"
                "Tipo TEXT );",
          );
          print("Tabla Favorito creada correctamente.");
        } catch (e) {
          print("Error al crear la tabla: $e");
        }
      },
    );
  }

  Future<bool> checkIfFavorite(int idPokemon) async {
    final db = await getDatabase();
    List<Map<String, dynamic>> res = await db!.query(
      "Favorito",
      where: "IdPokemon = ?",
      whereArgs: [idPokemon],
    );

   return res.isNotEmpty;
  }

  Future<List<Map<String, dynamic>>> getPokemonesFavourites() async {
    final db = await getDatabase();
    List<Map<String, dynamic>> res = await db!.query(
      "Favorito",
    );
    return res;
  }

  Future<int> insertPokemonFavorite(int idCurrentPokemon,EntidadPokemon pokemon) async {
    final db = await getDatabase();
    int res = await db!.rawInsert(
      "INSERT INTO Favorito(IdPokemon, Nombre, Imagen, Tipo) VALUES "
      "('$idCurrentPokemon','${pokemon.name}', '${pokemon.imageUrl}', '${pokemon.types.first}')",
    );
    return res;
  }

  Future<void> deletePokemon(int? id) async {
    final db = await getDatabase();
    await db!.delete('Favorito', where: "IdPokemon = ?", whereArgs: [id]);
  }
}
