import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              IconButton(onPressed:() => Navigator.pushNamed(context, '/f'), icon: Icon(Icons.error))
            ],
          ),
        ),
      ),
    );
  }
}