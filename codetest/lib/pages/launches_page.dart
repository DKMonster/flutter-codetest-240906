import 'package:codetest/models/launch.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: _buildAppBar(context),
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
            // TODO: 可以優化一下載入方式
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
                  return _buildListTile(launch);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // TODO: 這邊可以獨立成 Widget
  Widget _buildAppBar(BuildContext context) {
    return AppBar(
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

  Widget _buildListTile(Launch launch) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(launch.flightName, style: subTextStyle),
          Text(launch.missionName, style: textStyle),
        ],
      ),
      subtitle: Text(launch.launchDate, style: subTextStyle),
      // TODO: 這邊可以加入預載圖片或動畫box讓載入時不會一下空白
      trailing: CachedNetworkImage(
        imageUrl: launch.missionPatch,
        width: 50,
        height: 50,
        // TODO: 這邊之後可以調整成圖片或是就省略，看設計圖需要
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
