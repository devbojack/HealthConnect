import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:healthconnect/pages/signing/signup_widget.dart';
import '../../constants/new_color_constants.dart';
import '../../model/new_styles.dart';
import '../../provider/size_config.dart';
import '../../widgets/signing_widgets.dart';
import '../../widgets/text_icon_widgets.dart';
import 'login_widget.dart';

class SigningPage extends StatefulWidget {
  const SigningPage({super.key, required this.isSigningIn});

  final bool isSigningIn;

  @override
  State<SigningPage> createState() => _SigningPageState();
}

class _SigningPageState extends State<SigningPage> {
  late bool isSigningIn;
  final GlobalKey<FormState> signingKey = GlobalKey<FormState>();
  
  @override
  void initState() {
    isSigningIn = widget.isSigningIn;
    super.initState();
  }

  changeSigning() {
    setState(() {
      isSigningIn = !isSigningIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentScope = FocusScope.of(context);
    SizeConfig().init(context);
    double mHeight = SizeConfig.blockSizeH!;
    double mWidth = SizeConfig.blockSizeW!;
    bool isTablet = SizeConfig.blockSizeW! > 600;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        currentScope = FocusScope.of(context);
        if (currentScope.hasPrimaryFocus || currentScope.hasFocus) {
          currentScope.unfocus();
        }
      },
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          padding: isTablet
              ? const EdgeInsets.symmetric(vertical: 12, horizontal: 40)
              : const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              authHeader(mHeight, mWidth),
              isSigningIn ? const LoginWidget() : const SignUpWidget(),
              const SizedBox(height: 32),
              createAccountOrLogIn()
            ],
          ),
        ),
      ),
    );
  }

  //___________________________________________________WIDGETS
  authHeader(double mHeight, double mWidth) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ProLogo(mHeight: mHeight, mWidth: mWidth),
          const SizedBox(height: 16),
          veryBigTextBold(
              isSigningIn ? 'Sign In' : 'Create Account', mHeight, context),
          const SizedBox(height: 16),
        ],
      );

  createAccountOrLogIn() => SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            normalText(
                isSigningIn
                    ? "Don't have an account?  "
                    : "Already have an account?  ",
                context),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: changeSigning,
              child: normalBoldColoredText(
                isSigningIn ? "Create Account" : "Sign In",
                appOrange,
              ),
            ),
          ],
        ),
      );

  ///_____________________________________________________________Sign In or Sign Up
  signInOrUp(bool isSigning, BuildContext context) => RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            normalTextSpan(
              isSigningIn
                  ? 'Don\'t have an account? '
                  : 'Already have an account? ',
              context,
            ),
            TextSpan(
                text: isSigningIn ? 'Create Account.' : 'Sign In.',
                style: sizedWeightedColoredTextStyle(
                    context, 12, FontWeight.bold, appOrange),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => changeSigning())
          ],
        ),
      );
}
