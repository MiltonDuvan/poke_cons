import 'package:flutter/material.dart';
import 'package:poke_cons/ui/views/pokemon_detail.dart';
import 'package:poke_cons/viewmodels/pokemon_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PokemonSearchPage extends StatelessWidget {
  const PokemonSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PokemonViewmodel>.reactive(
      viewModelBuilder: () => PokemonViewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                _search(context, viewModel),
                _pokemonList(context, viewModel),
              ],
            ),
          )),
        );
      },
    );
  }

  Widget _search(BuildContext context, PokemonViewmodel viewmodel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.3,
          width: MediaQuery.of(context).size.width * 0.7,
          child: TextFormField(
            onChanged: (text) {
              viewmodel.filterPokemon(text.toLowerCase());
            },
            decoration: InputDecoration(
              fillColor: const Color(0XFFF6F6F6),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 24,
              ),
              contentPadding: const EdgeInsets.all(0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
              hintText: "ditto",
              hintStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
              filled: true,
            ),
          ),
        )
      ],
    );
  }

  Widget _pokemonList(BuildContext context, PokemonViewmodel viewmodel) {
    return SizedBox(
      width: 100,
      height: 300,
      child: ListView.builder(
        itemCount: viewmodel.filteredPokemonList.length,
        itemBuilder: (context, index) {
          final pokemon = viewmodel.filteredPokemonList[index];
          return ListTile(
            title: Text(pokemon['name']),
            onTap: () async {
              final details = await  viewmodel.getPokemonDetails(pokemon['url']);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PokemonDetailPage(
                      details:details)));
            },
          );
        },
      ),
    );
  }
}
