import 'package:flutter/material.dart';
import 'package:codetest/flavors.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;
  final bool show;

  const FlavorBanner({
    super.key,
    required this.child,
    this.show = true,
  });

  @override
  Widget build(BuildContext context) {
    return show
        ? Banner(
            location: BannerLocation.topStart,
            message: F.name,
            color: Colors.green.withOpacity(0.6),
            textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12.0,
                letterSpacing: 1.0),
            textDirection: TextDirection.ltr,
            child: child,
          )
        : Container(
            child: child,
          );
  }
}
