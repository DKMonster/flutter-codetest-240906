import 'package:flutter/material.dart';
import '../flavors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'Hello ${F.title}',
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Go to the launchers page'),
          ),
        ],
      ),
    );
  }
}
