import 'package:flutter/material.dart';
import 'package:healthconnect/widgets/background.dart';

import '../../../constants/assets_constants.dart';

class GoogleAuthPage extends StatefulWidget {
  const GoogleAuthPage({super.key});

  @override
  State<GoogleAuthPage> createState() => _GoogleAuthPageState();
}

class _GoogleAuthPageState extends State<GoogleAuthPage> {
  @override
  Widget build(BuildContext context) {
    return MyBackground(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetConstants.lightLogoImage), fit: BoxFit.contain,
                )
              )
            ),
            const SizedBox(height: 32),
            CircularProgressIndicator(color: Theme.of(context).indicatorColor),
          ]
        )
      )
    );
  }
}
