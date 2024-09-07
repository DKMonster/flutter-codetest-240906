import 'package:flutter/material.dart';
import 'package:codetest/config/text.dart';
import 'package:codetest/config/color.dart';

class LaunchesPage extends StatelessWidget {
  const LaunchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 4,
        leading: const Icon(
          Icons.arrow_back,
          color: appBarIconColor,
        ),
        title: const Text(
          'All Launches',
          style: appBarTextStyle,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: appBarIconColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Sorting Button and not full width
                IconButton(
                  icon: const Row(
                    children: [
                      Icon(Icons.sort, color: subTextActionColor),
                      SizedBox(width: 8),
                      Text('Flight number: oldest', style: sortButtonTextStyle),
                    ],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Launch ${index + 1}', style: textStyle),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
