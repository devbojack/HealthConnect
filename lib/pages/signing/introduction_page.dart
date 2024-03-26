import 'package:flutter/material.dart';
import 'package:healthconnect/constants/assets_constants.dart';
import 'package:healthconnect/provider/size_config.dart';
import 'package:healthconnect/widgets/build_button.dart';
import 'package:healthconnect/widgets/my_background.dart';
import 'package:healthconnect/widgets/signing_widgets.dart';
import 'package:lottie/lottie.dart';
import '../../widgets/text_icon_widgets.dart';
import 'signing_page.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  bool isIntroPage = true;
  bool isSigning = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double mHeight = SizeConfig.blockSizeH!;
    double mWidth = SizeConfig.blockSizeW!;
    bool isTablet = SizeConfig.blockSizeW! > 600;
    return MyBackground(
      child: SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  actions: isIntroPage
                      ? []
                      : [
                          GestureDetector(
                            onTap: removeIntroPage,
                            child: normalIcon(Icons.close, context),
                          ),
                          const SizedBox(width: 12)
                        ]),
              body: isIntroPage
                  ? SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ProLogo(mHeight: mHeight, mWidth: mWidth),
                          Text('Bridging Wellness Together!',
                              style: Theme.of(context).textTheme.bodyLarge),
                          SizedBox(
                              height: mHeight * 20,
                              child: Lottie.asset(
                                  JsonConstants.introductionLottie)),
                          BuildButton(
                              onPressed: showGetStarted,
                              buttonColor: Theme.of(context).primaryColor,
                              buttonTitle: 'Get Started')
                        ],
                      ),
                    )
                  : SigningPage(isSigningIn: isSigning))),
    );
  }

  showGetStarted() {
    showModalBottomSheet(
        elevation: 3,
        backgroundColor: Colors.black,
        useSafeArea: true,
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 200,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(height: 24),
                    NonBlueButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            isSigning = false;
                          });
                          removeIntroPage();
                        },
                        buttonColor: Colors.white,
                        buttonTitle: 'Create Account',
                        titleColor: Colors.black),
                    const SizedBox(height: 24),
                    BuildButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            isSigning = true;
                          });
                          removeIntroPage();
                        },
                        buttonColor: Theme.of(context).primaryColor,
                        buttonTitle: 'Sign In'),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          );
        });
  }

  removeIntroPage() {
    setState(() {
      isIntroPage = !isIntroPage;
    });
  }
}
