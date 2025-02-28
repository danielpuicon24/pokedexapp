import 'dart:convert';

class EntidadPokemon {
  String name;
  String imageUrl;
  List<String> types;
  List<String> abilities;
  List<String> moves;
  Map<String, int> stats;
  List<String> sprites;

  EntidadPokemon({
    this.name = '',
    this.imageUrl = '',
    this.types = const [],
    this.abilities = const [],
    this.moves = const [],
    this.stats = const {},
    this.sprites = const [],
  });

  EntidadPokemon copyWith({
    String? name,
    String? imageUrl,
    List<String>? types,
    List<String>? abilities,
    List<String>? moves,
    Map<String, int>? stats,
    List<String>? sprites,
  }) =>
      EntidadPokemon(
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        types: types ?? this.types,
        abilities: abilities ?? this.abilities,
        moves: moves ?? this.moves,
        stats: stats ?? this.stats,
        sprites: sprites ?? this.sprites,
      );

  factory EntidadPokemon.fromMap(Map<String, dynamic> json) {
    final spritesJson = json["sprites"] ?? {};

    Map<String, String> extractedSprites = {};
    for (var key in spritesJson.keys) {
      if (spritesJson[key] is String) {
        extractedSprites[key] = spritesJson[key];
      } else if (spritesJson[key] is Map) {
        for (var subKey in spritesJson[key].keys) {
          if (spritesJson[key][subKey] is String) {
            extractedSprites["$key-$subKey"] = spritesJson[key][subKey];
          }
        }
      }
    }

    return EntidadPokemon(
      name: json["name"] ?? "",
      imageUrl: spritesJson["other"]?["official-artwork"]?["front_default"] ?? "",
      types: (json["types"] as List<dynamic>?)
          ?.map((type) => type["type"]["name"].toString())
          .toList() ??
          [],
      abilities: (json["abilities"] as List<dynamic>?)
          ?.map((ability) => ability["ability"]["name"].toString())
          .toList() ??
          [],
      moves: (json["moves"] as List<dynamic>?)
          ?.map((move) => move["move"]["name"].toString())
          .toList() ??
          [],
      stats: {
        for (var stat in (json["stats"] as List<dynamic>? ?? []))
          stat["stat"]["name"].toString(): stat["base_stat"] as int
      },
      sprites: _extractImages(json["sprites"]),
    );
  }

  static List<String> _extractImages(Map<String, dynamic>? sprites) {
    List<String> images = [];

    void extract(Map<String, dynamic>? data) {
      if (data == null) return;
      for (var value in data.values) {
        if (value is String && value.isNotEmpty) {
          images.add(value);
        } else if (value is Map<String, dynamic>) {
          extract(value);
        }
      }
    }

    extract(sprites);
    return images;
  }

  Map<String, dynamic> toMap() => {
    "name": name,
    "imageUrl": imageUrl,
    "types": types,
    "abilities": abilities,
    "moves": moves,
    "stats": stats,
    "sprites": sprites, // Guardamos también los sprites en el JSON
  };

  factory EntidadPokemon.fromJson(String str) =>
      EntidadPokemon.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
}

