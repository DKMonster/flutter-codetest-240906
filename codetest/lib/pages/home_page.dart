import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:codetest/flavors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Hello ${F.title}',
            ),
          ),
          ElevatedButton(
            onPressed: () => context.go('/launches'),
            child: const Text('Go to the launchers page'),
          ),
        ],
      ),
    );
  }
}
