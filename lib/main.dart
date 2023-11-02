import 'package:flutter/material.dart';
import 'package:poke_cons/ui/views/404_page.dart';
import 'package:poke_cons/ui/views/welcome_screen.dart';
import 'package:poke_cons/ui/views/pokemon_page.dart';
import 'package:poke_cons/ui/views/pokemon_search_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreenPage(),
        '/home': (context) => const PokemonView(),
        '/searchPage':(context) =>  const PokemonSearchPage(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder:(context) => const Page404(),);
      },
    );
  }
}
