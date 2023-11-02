import 'package:flutter/material.dart';
import 'package:poke_cons/core/models/pokemon_detail_model.dart';

class PokemonDetailPage extends StatelessWidget {
  final PokemonDetailModel details;
  const PokemonDetailPage({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
                color: const Color(0XFFF6F6F6),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3))
                ]),
            child: Column(
              children: [
                spaceBetween(context),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButton(),
                    IconButton(onPressed: null, icon: Icon(Icons.error_outline))
                  ],
                ),
                spaceBetween(context),
                Text(
                  details.forms[0].name.toUpperCase(),
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87),
                ),
                Text(
                  '${details.stats[0].baseStat} Hp',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.055,
                      fontWeight: FontWeight.w400,
                      color: const Color(0XFF909090)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Image.network(
                  '${details.sprites.other?.officialArtwork.frontDefault}',
                  scale: 1.5,
                ),
                spaceBetween(context),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.8, color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.01),
                    child: Text(details.types[0].type.name,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                spaceBetween(context),
                pokemonInformation(context, 'Altura', '${details.height}'),
                pokemonInformation(context, 'Peso', '${details.weight}'),
                pokemonInformation(
                    context, 'Experiencia', '${details.baseExperience}'),
                spaceBetween(context),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          '${details.stats[1].baseStat}K',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Ataque',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.w300,
                              color: Color(0XFF909090)),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '${details.stats[5].baseStat}K',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Velocidad',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.w300,
                              color: const Color(0XFF909090)),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '${details.stats[2].baseStat}K',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Defensa',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.w300,
                              color: const Color(0XFF909090)),
                        ),
                      ],
                    )
                  ],
                ),
                spaceBetween(context),
                spaceBetween(context)
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget spaceBetween(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.04,
    );
  }

  Widget pokemonInformation(BuildContext context, String title, String result) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.07),
      child: Container(
        width: MediaQuery.of(context).size.width - 80,
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.2)),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.width * 0.002),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    fontWeight: FontWeight.w300),
              ),
              Text(result,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      fontWeight: FontWeight.w600))
            ],
          ),
        ),
      ),
    );
  }
}
