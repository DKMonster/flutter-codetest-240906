import 'package:go_router/go_router.dart';

import 'package:codetest/pages/home_page.dart';
import 'package:codetest/pages/launches_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/launches',
      builder: (context, state) => const LaunchesPage(),
    ),
    // 添加其他路由
  ],
);
