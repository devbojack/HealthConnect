
import 'package:flutter/material.dart';
import 'package:healthconnect/constants/image_constants.dart';
import 'package:lottie/lottie.dart';
import '../../main.dart';
import '../../widgets/my_background.dart';
import '../../widgets/text_icon_widgets.dart';

class HomeLoadingPage extends StatefulWidget {
  const HomeLoadingPage({super.key});

  @override
  State<HomeLoadingPage> createState() => _HomeLoadingPageState();
}

class _HomeLoadingPageState extends State<HomeLoadingPage> {
  static const String versionNumber = appVersion;

  @override
  Widget build(BuildContext context) {
    return MyBackground(
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        height: 60,
                        child:
                            Lottie.asset(loadingLottie, fit: BoxFit.contain)),
                    const SizedBox(height: 4),
                    normalSizeText(versionNumber, 10, context)
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
