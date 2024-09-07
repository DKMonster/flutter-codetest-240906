import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:codetest/config/router.dart';
import 'package:codetest/flavors.dart';
import 'package:codetest/widgets/flavor_banner.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: F.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) {
        return FlavorBanner(
          show: kDebugMode,
          child: child!,
        );
      },
    );
  }
}
