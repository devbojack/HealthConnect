import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthconnect/widgets/build_button.dart';
import 'package:healthconnect/widgets/my_background.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../../constants/new_color_constants.dart';
import '../../provider/size_config.dart';
import '../../widgets/signing_widgets.dart';
import '../../widgets/text_icon_widgets.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {

  bool isLoading = false;
  bool hasResendEmail = false;
  bool timerIsDone = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double mHeight = SizeConfig.blockSizeH!;
    double mWidth = SizeConfig.blockSizeW!;
    bool isTablet = SizeConfig.blockSizeW! > 600;
    return MyBackground(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              GestureDetector(
                onTap: cancelVerify,
                child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: normalIcon(Icons.close, context)),
              ),
            ],
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: isTablet
                ? const EdgeInsets.symmetric(vertical: 24, horizontal: 40)
                : const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [verifyHeader(mHeight, mWidth), verifyBody(mHeight)],
            ),
          ),
        ),
      ),
    );
  }

  verifyHeader(double mHeight, double mWidth) => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                ProLogo(mHeight: mHeight, mWidth: mWidth),
                const SizedBox(height: 24),
                veryBigTextBold('Verify Your Account', mHeight, context),
                const SizedBox(height: 32),
                bigCenteredText(
                    'Please check you email for the confirmation mail. Click the link in the email to complete the verification  ',
                    context),
              ],
            ),
          ],
        ),
      );

  verifyBody(double mHeight) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          timerIsDone
              ? BuildButton(
                  onPressed: resendVerifyEmail,
                  buttonColor: newAppBlue,
                  buttonTitle: 'Resend Email')
              : Countdown(
                  seconds: 150,
                  build: (BuildContext context, double time) =>
                      normalBoldText('You can try again in $time', context),
                  interval: const Duration(seconds: 1),
                  onFinished: () {
                    setState(() {
                      timerIsDone = true;
                    });
                  }),

          const SizedBox(height: 40),
        ],
      );

  Future<void> cancelVerify() async {
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      showSimpleNotification(
        const Text(
          'error',
          style: TextStyle(color: Colors.white, fontSize: 11),
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.all(12),
        background: Colors.red,
      );
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> resendVerifyEmail() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: newAppBlue,
              ),
            ));
    try {
      await FirebaseAuth.instance.currentUser
          ?.sendEmailVerification()
          .then((_) => startCountdown());
      showSimpleNotification(
        const Text(
          'Sent',
          style: TextStyle(color: Colors.white, fontSize: 11),
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.all(12),
        background: appGreen,
      );
    } on FirebaseAuthException catch (e) {
      showSimpleNotification(
        const Text(
          'Error',
          style: TextStyle(color: Colors.white, fontSize: 11),
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.all(12),
        background: Colors.red,
      );
    } catch (e) {
      print(e);
    }
    if (context.mounted) Navigator.of(context).pop();
  }

  startCountdown() {
    setState(() {
      timerIsDone = false;
    });
  }
}
