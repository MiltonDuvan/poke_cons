import 'package:flutter/material.dart';
import 'package:poke_cons/core/models/pokemon_detail_model.dart';

class PokemonDetailPage extends StatelessWidget {
  final PokemonDetailModel details;
   const PokemonDetailPage({super.key, required this.details,});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Detalle del pokemon'),
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Nombre: ${details.forms[0].name.toUpperCase()}'),
            Row(
              children: [
                Text('habilidades: ${details.abilities[0].ability.name} '),
                Text('Experiencia: ${details.baseExperience} ')
              ],
            ),
            Image.network('${details.sprites.other?.officialArtwork.frontDefault}'),
          ],
        ),
      )),
    );
  }
}