import 'package:flutter/material.dart';
import 'package:healthconnect/constants/assets_constants.dart';

//________________________________________________________________________________WIDGETS

class ProLogo extends StatelessWidget {
  const ProLogo({required this.mHeight, required this.mWidth, super.key});
  final double mHeight;
  final double mWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mHeight * 20,
      width: mWidth * 60,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Theme.of(context).brightness == Brightness.dark ? AssetConstants.lightAppLogo : AssetConstants.darkAppLogo),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
