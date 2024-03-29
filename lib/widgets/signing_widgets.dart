import 'package:flutter/material.dart';
import 'package:healthconnect/constants/assets_constants.dart';
import 'package:healthconnect/widgets/text_icon_widgets.dart';

//________________________________________________________________________________WIDGETS

class ProLogo extends StatelessWidget {
  const ProLogo({required this.mHeight, required this.mWidth, super.key});
  final double mHeight;
  final double mWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
      height: mHeight * 20,
      width: mWidth * 60,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetConstants.appLogo),
          fit: BoxFit.contain,
        ),
      ),
    ),
    const SizedBox(height: 8),
    veryBigTextBold('HealthConnect', mHeight, context),
    ],);
  }
}
