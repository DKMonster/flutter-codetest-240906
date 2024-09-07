import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:codetest/config/text.dart';
import 'package:codetest/config/color.dart';
import 'package:codetest/providers/launches_providers.dart';

class LaunchesPage extends ConsumerWidget {
  const LaunchesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final launches = ref.watch(launchesProvider);
    return Scaffold(
      backgroundColor: bodyColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 4,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: appBarIconColor,
          ),
          onPressed: () => context.pop(),
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
                _buildSortingButtonWidget(),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: launches.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) {
                // testing the error
                debugPrint('error: $error');
                return const Center(
                  child: Text(
                    '資料載入失敗',
                    style: textStyle,
                  ),
                );
              },
              data: (launchList) => ListView.builder(
                itemCount: launchList.length,
                itemBuilder: (context, index) {
                  final launch = launchList[index];
                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(launch.flightName, style: subTextStyle),
                        Text(launch.missionName, style: textStyle),
                      ],
                    ),
                    subtitle: Text(launch.launchDate, style: subTextStyle),
                    trailing: Image.network(launch.missionPatch),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSortingButtonWidget() {
    return IconButton(
      icon: const Row(
        children: [
          Icon(Icons.sort, color: subTextActionColor),
          SizedBox(width: 8),
          Text('Flight number: oldest', style: sortButtonTextStyle),
        ],
      ),
      onPressed: () {},
    );
  }
}
