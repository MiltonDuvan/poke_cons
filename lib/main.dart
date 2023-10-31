import 'package:flutter/material.dart';
import 'package:poke_cons/ui/views/404_page.dart';
import 'package:poke_cons/ui/views/home_page.dart';
import 'package:poke_cons/ui/views/other_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/other',
      routes: {
        '/': (context) => HomePage(),
        '/other': (context) => OtherPage()
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder:(context) => Page404(),);
      },
    );
  }
}
