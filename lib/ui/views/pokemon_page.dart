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
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: const SearchEngineWidget()),
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
                  itemBuilder: (context, index) {
                    final pokemonData = pokemonList[index];
                    final pokemonName = pokemonData['name'];
                    final formattedName =
                        pokemonName[0].toUpperCase() + pokemonName.substring(1);
                    final pokemonUrl = pokemonData['url'];
                    return Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.03,
                          bottom: MediaQuery.of(context).size.width * 0.03,
                          left: MediaQuery.of(context).size.width * 0.06,
                          right: MediaQuery.of(context).size.width * 0.06),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFF6F6F6),
                            border: Border.all(width: 0.03, color: Colors.grey),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0.5,
                                  blurRadius: 1.5,
                                  offset: const Offset(0, 2))
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.47,
                                child: Text(
                                  formattedName,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.045,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Averta',
                                      color: Colors.black87),
                                )),
                            TextButton(
                                onPressed: () async {
                                  final details = await viewModel
                                      .getPokemonDetails(pokemonUrl);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PokemonDetailPage(details: details),
                                      ));
                                },
                                child: Text(
                                  'Mostrar más',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.03,
                                  ),
                                ))
                          ],
                        ),
                      ),
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
