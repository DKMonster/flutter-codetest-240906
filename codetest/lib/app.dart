import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:codetest/flavors.dart';
import 'package:codetest/widgets/flavor_banner.dart';
import 'package:codetest/pages/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: F.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlavorBanner(
        show: kDebugMode,
        child: HomePage(),
      ),
    );
  }
}
