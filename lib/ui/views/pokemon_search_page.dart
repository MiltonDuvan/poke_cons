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
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const BackButton(
                  color: Colors.black,
                ),
                _search(context, viewModel),
              ],
            ),
          ),
          body: SingleChildScrollView(
              child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.045,
                ),
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
          width: MediaQuery.of(context).size.width * 0.7,
          child: TextFormField(
            onChanged: (text) {
              viewmodel.filterPokemon(text.toLowerCase());
            },
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              fillColor: Colors.black87,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white70,
                size: MediaQuery.of(context).size.width * 0.055,
              ),
              contentPadding: const EdgeInsets.all(0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
              hintText: "ditto",
              hintStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.038,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
              filled: true,
            ),
          ),
        )
      ],
    );
  }

  Widget _pokemonList(BuildContext context, PokemonViewmodel viewmodel) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      height: MediaQuery.of(context).size.width * 1.7,
      child: ListView.builder(
        itemCount: viewmodel.filteredPokemonList.length,
        itemBuilder: (context, index) {
          final pokemon = viewmodel.filteredPokemonList[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1),
            visualDensity: VisualDensity.standard,
            title: Container(
              decoration:
                  const BoxDecoration(border: Border(bottom: BorderSide(width: 0.3))),
              child: Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.01, bottom: MediaQuery.of(context).size.width * 0.04),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      pokemon['name'],
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            onTap: () async {
              final details = await viewmodel.getPokemonDetails(pokemon['url']);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PokemonDetailPage(details: details)));
            },
          );
        },
      ),
    );
  }
}
