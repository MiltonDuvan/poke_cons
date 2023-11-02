import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:poke_cons/core/models/pokemon_detail_model.dart';
import 'package:poke_cons/global/global_var.dart';
import 'package:stacked/stacked.dart';

class PokemonViewmodel extends BaseViewModel {
  List<Map<String, dynamic>> _originalPokemonList = [];
  List<Map<String, dynamic>> _filteredPokemonList = [];

  PokemonViewmodel() {
    getPokemonList().then((pokemonList) {
      _originalPokemonList = pokemonList;
      _filteredPokemonList = _originalPokemonList;
      notifyListeners();
    });
  }

  Future<List<Map<String, dynamic>>> getPokemonList() async {
    final response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final results = jsonData['results'] as List;
      final pokemonList = results.cast<Map<String, dynamic>>();
      return pokemonList;
    } else {
      print('Error en la respuesta ${response.body}');
      throw Exception('Fallo en la solicitud HTTP');
    }
  }

  Future<PokemonDetailModel> getPokemonDetails(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return PokemonDetailModel.fromJson(jsonData);
    } else {
      print('Error en la respuesta ${response.body}');
      throw Exception('Fallo en la solicitud HTTP');
    }
  }

  void filterPokemon(String searchText) {
    _filteredPokemonList = _originalPokemonList
        .where((pokemon) =>
            (pokemon['name'] as String).contains(searchText.toLowerCase()))
        .toList();
    notifyListeners();
  }

  List<Map<String, dynamic>> get filteredPokemonList => _filteredPokemonList;
}
