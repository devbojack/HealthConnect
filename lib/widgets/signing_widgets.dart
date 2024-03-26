import 'package:flutter/material.dart';
import '../constants/image_constants.dart';

//________________________________________________________________________________WIDGETS

class ProLogo extends StatelessWidget {
  const ProLogo({required this.mHeight, super.key});
  final double mHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mHeight * 20,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Theme.of(context).brightness == Brightness.dark ? sbLogoLight : sbLogoDark),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
