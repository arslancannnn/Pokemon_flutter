import 'dart:convert';

import 'package:get/get.dart';
import 'package:pokepon/model/pokemon_model.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController {
  var pokemonList = <PokemonModel>[].obs;
  var isLoading = true.obs;
  String name = '';

  @override
  void onInit() {
    super.onInit();
    if (name != '') {
      fetchPokemonData(name);
    }
  }

  Future<void> fetchPokemonData(String name) async {
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));

    if (response.statusCode == 200) {
      PokemonModel pokemon = PokemonModel.fromJson(jsonDecode(response.body));

      pokemonList.clear();

      pokemonList.add(PokemonModel(
          name: pokemon.name,
          back_default: pokemon.back_default,
          back_shiny: pokemon.back_shiny));

      isLoading.value = true;
    } else {
      pokemonList.clear();
      Get.snackbar('Error Loading data!',
          'server responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
