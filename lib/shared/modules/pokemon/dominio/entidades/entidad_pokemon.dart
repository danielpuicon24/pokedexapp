import 'dart:convert';

class EntidadPokemon {
  String name;
  String imageUrl;
  List<String> types;
  Map<String, int> stats;

  EntidadPokemon({
    this.name = '',
    this.imageUrl = '',
    this.types = const [],
    this.stats = const {},
  });

  EntidadPokemon copyWith({
    String? name,
    String? imageUrl,
    List<String>? types,
    Map<String, int>? stats,
  }) =>
      EntidadPokemon(
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        types: types ?? this.types,
        stats: stats ?? this.stats,
      );

  factory EntidadPokemon.fromMap(Map<String, dynamic> json) {
    return EntidadPokemon(
      name: json["name"] ?? "", // Evita null en 'name'
      imageUrl: (json["sprites"] != null &&
          json["sprites"]["other"] != null &&
          json["sprites"]["other"]["official-artwork"] != null)
          ? json["sprites"]["other"]["official-artwork"]["front_default"] ?? ""
          : "",
      types: (json["types"] as List<dynamic>?)
          ?.map((type) => type["type"]["name"].toString())
          .toList() ??
          [],
      stats: {
        for (var stat in (json["stats"] as List<dynamic>? ?? []))
          stat["stat"]["name"].toString(): stat["base_stat"] as int
      },
    );
  }


  Map<String, dynamic> toMap() => {
    "name": name,
    "imageUrl": imageUrl,
    "types": types,
    "stats": stats,
  };

  factory EntidadPokemon.fromJson(String str) =>
      EntidadPokemon.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
}
