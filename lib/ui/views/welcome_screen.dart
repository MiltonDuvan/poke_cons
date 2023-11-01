import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poke_cons/viewmodels/pokemon_viewmodel.dart';
import 'package:stacked/stacked.dart';

class WelcomeScreenPage extends StatelessWidget {
  const WelcomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PokemonViewmodel>.reactive(
        viewModelBuilder: () => PokemonViewmodel(),
        onViewModelReady: (viewModel) {
          Future.delayed(const Duration(seconds: 4), () {
            Navigator.pushNamed(context, '/home');
          });
        },
        builder: (context, viewModel, child) =>  Scaffold(
            backgroundColor: Colors.black26,
              body: Center(
                child: Image.asset('assets/images/splash_poke.png',scale: 1.5,),
              ),
            ));
  }
}
