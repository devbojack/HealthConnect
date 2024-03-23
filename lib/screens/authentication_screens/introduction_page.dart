import 'package:flutter/material.dart';
import 'package:healthconnect/widgets/background.dart';
import '../../constants/assets_constants.dart';
import '../../providers/size_config.dart';
import '../../widgets/buton.dart';
import '../../widgets/text.dart';

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
            body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    height: mHeight * 15,
                    width: 40,
                    child: const Image(
                        image: AssetImage(introductionImage),
                        fit: BoxFit.contain),
                  ),
                  SizedBox(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          veryBigTextBold('Welcome To', mHeight, context),
                          const SizedBox(height: 12),
                          Container(
                            height: mHeight * 12,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(lightLogoImage),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          bigCenteredText(
                              "Bridging Wellness Together!", context)
                        ]),
                  ),
                  BuildButton(
                      onPressed: showGetStarted,
                      buttonColor: Theme.of(context).primaryColor,
                      buttonTitle: 'Get Started')
                ],
              ),
            )),
      ),
    );
  }

  showGetStarted() {
    showModalBottomSheet(
        elevation: 3,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                    Container(
                      height: 28,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AssetConstants.lightIconPath),
                              fit: BoxFit.contain)),
                    ),
                    const SizedBox(height: 24),
                    BuildButtonWithIcon(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            isSigning = false;
                          });
                          removeIntroPage();
                        },
                        isEmail: true),
                    const SizedBox(height: 24),
                    BuildButtonWithIcon(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            isSigning = true;
                          });
                          removeIntroPage();
                        },
                        isEmail: false),
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
