import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthconnect/widgets/auth_field.dart';
import 'package:healthconnect/widgets/build_button.dart';
import 'package:healthconnect/widgets/my_background.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../../constants/new_color_constants.dart';
import '../../model/new_styles.dart';
import '../../provider/size_config.dart';
import '../../widgets/signing_widgets.dart';
import '../../widgets/text_icon_widgets.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool hasSentResetEmail = false;
  bool timerIsDone = true;
  bool isLoading = false;
  String userEmail = '';
  final GlobalKey<FormState> forgotPasswordKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  late AutovalidateMode myAutoValidate;

  @override
  void initState() {
    myAutoValidate = AutovalidateMode.disabled;
    super.initState();
  }

  changeSigning() {
    setState(() {
      hasSentResetEmail = !hasSentResetEmail;
    });
  }

  enableValidate() {
    setState(() {
      myAutoValidate = AutovalidateMode.always;
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
      child: MyBackground(
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: normalIcon(Icons.arrow_back_ios, context),
                ),
              ),
            ),
            body: SizedBox(
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
                    ProLogo(mHeight: mHeight, mWidth: mWidth),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 16),
                        veryBigTextBold(
                            hasSentResetEmail
                                ? 'Check your email'
                                : 'Reset Password',
                            mHeight,
                            context),
                        const SizedBox(height: 32),
                        normalCenteredText(
                            hasSentResetEmail
                                ? 'We have sent a password recover instructions to your email'
                                : 'Don\'t worry, it happens. Please enter your email address '
                                    'associated with your account and we\'ll send an email '
                                    'with instructions to reset your password.', FontWeight.normal,
                            context,),
                        const SizedBox(height: 32),
                        hasSentResetEmail
                            ? timerIsDone
                                ? GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () => changeSigning(),
                                    child: Text(
                                      'Try Again',
                                      style: normalGreenBoldTextStyle(context),
                                    ))
                                : Countdown(
                                    seconds: 150,
                                    build:
                                        (BuildContext context, double time) =>
                                            normalBoldText(
                                                'You can try again in $time',
                                                context),
                                    interval: const Duration(seconds: 1),
                                    onFinished: () {
                                      setState(() {
                                        timerIsDone = true;
                                      });
                                    })
                            : Column(
                                children: [
                                  Form(
                                      key: forgotPasswordKey,
                                      child: AuthEmail(
                                        emailController: emailController,
                                        autoValidateMode: myAutoValidate,
                                      )),
                                  const SizedBox(height: 40),
                                  BuildButton(
                                      onPressed: () {
                                        currentScope = FocusScope.of(context);
                                        if (currentScope.hasPrimaryFocus ||
                                            currentScope.hasFocus) {
                                          currentScope.unfocus();
                                        }
                                        sendPasswordReset();
                                      },
                                      buttonColor: newAppBlue,
                                      buttonTitle: 'Continue'),
                                  const SizedBox(height: 16),
                                ],
                              ),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> sendPasswordReset() async {
    enableValidate();
    forgotPasswordKey.currentState?.save();
    if (!forgotPasswordKey.currentState!.validate()) return;
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: newAppBlue,
              ),
            ));
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.sendPasswordResetEmail(email: emailController.text.trim());
      setState(() {
        hasSentResetEmail = true;
        timerIsDone = false;
      });
    } on FirebaseAuthException catch (e) {
      String error = 'Error';
      if (e.code == 'user-not-found') {
        error = 'No user associated with the email.';
        print(e);
      } else {
        error = e.toString();
      }
      showSimpleNotification(
        Text(
          error,
          style: const TextStyle(color: Colors.white, fontSize: 11),
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
}
