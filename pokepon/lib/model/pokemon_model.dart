class PokemonModel {
  final String name, back_default, back_shiny;

  PokemonModel(
      {required this.name,
      required this.back_default,
      required this.back_shiny});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    var a = json['sprites'];
    return PokemonModel(
        name: json['name'],
        back_default: a['front_default'],
        back_shiny: a['front_shiny']);
  }
}
