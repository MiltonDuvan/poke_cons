import 'package:flutter/material.dart';

class Page404 extends StatelessWidget {
  const Page404({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/home'),
      child: Scaffold(
        body: Center(
          child: Image.asset(
            'assets/images/404_not_found.png',
            scale: 1.5,
          ),
        ),
      ),
    );
  }
}
