import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:healthconnect/providers/size_config.dart';
import 'package:healthconnect/screens/authentication_screens/email_auth/email_sign_up.dart';
import 'package:healthconnect/widgets/login_widget.dart';
import 'package:healthconnect/widgets/text.dart';

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
              authHeader(mHeight),
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
  authHeader(double mHeight) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
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
              child: normalText(
                isSigningIn ? "Create Account" : "Sign In", context,
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
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.bold, ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => changeSigning())
          ],
        ),
      );
}
