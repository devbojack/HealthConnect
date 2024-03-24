import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      child: Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          Theme.of(context).brightness == Brightness.dark
                              ? AssetConstants.lightAppLogo
                              : AssetConstants.darkAppLogo),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  height: 32,
                  width: 32,
                  child: CircularProgressIndicator(
                      color: Theme.of(context).indicatorColor),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(height: 24, width: 24, decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetConstants.googleLogo), fit: BoxFit.contain,
                    )
                  )),
                  const SizedBox(width: 12),
                  Text(
                  'Loading...',
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: Theme.of(context).indicatorColor.withOpacity(0.6),
                    fontWeight: FontWeight.w700,
                  ),
                ),])
              ]),
        ),
      ),
    );
  }
}
