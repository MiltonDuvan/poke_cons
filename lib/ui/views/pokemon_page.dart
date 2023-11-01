import 'package:flutter/material.dart';
import 'package:poke_cons/ui/views/pokemon_detail.dart';
import 'package:poke_cons/viewmodels/pokemon_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../widgets/search_engine_widget.dart';

class PokemonView extends StatelessWidget {
  const PokemonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
       title: const SearchEngineWidget()
      ),
      body: ViewModelBuilder<PokemonViewmodel>.reactive(
        viewModelBuilder: () => PokemonViewmodel(),
        builder: (context, viewModel, child) {
          return FutureBuilder<List<Map<String, dynamic>>>(
            future: viewModel.getPokemonList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error:  ${snapshot.data}');
              } else {
                final pokemonList = snapshot.data;
                
                return ListView.builder(
                  itemCount: pokemonList!.length,
                  itemBuilder:(context, index) {
                    final pokemonData = pokemonList[index];
                    final pokemonName = pokemonData['name'];
                    final pokemonUrl = pokemonData['url'];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Text(pokemonName), 
                      TextButton(onPressed:() async{
                        final details = await viewModel.getPokemonDetails(pokemonUrl);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PokemonDetailPage( details: details),));
                      }, child: Text('Mostrar mas'))],
                    );
                  }, 
                );
              }
            },
          );
        },
      ),
    );
  }
}