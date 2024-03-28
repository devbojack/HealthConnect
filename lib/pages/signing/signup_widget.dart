import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import '../../constants/new_color_constants.dart';
import '../../widgets/auth_field.dart';
import '../../widgets/build_button.dart';
import '../../widgets/text_icon_widgets.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  late AutovalidateMode myAutoValidate;
  bool isLoadingSignUp = false;

  @override
  void initState() {
    myAutoValidate = AutovalidateMode.disabled;
    super.initState();
  }

  enableValidate() {
    setState(() {
      myAutoValidate = AutovalidateMode.always;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentScope = FocusScope.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Form(
          key: signUpKey,
          child: Column(
            children: [
              AuthEmail(
                  emailController: emailController,
                  autoValidateMode: myAutoValidate),
              AuthPassword(
                passwordController: passwordController,
                autoValidateMode: myAutoValidate,
                isSigningIn: false,
              ),
              normalBoldColoredText('!', Colors.transparent),
              const SizedBox(height: 24),
              isLoadingSignUp
                  ? const CupertinoActivityIndicator(color: newAppBlue)
                  : BuildButton(
                      onPressed: () {
                        currentScope = FocusScope.of(context);
                        if (currentScope.hasPrimaryFocus ||
                            currentScope.hasFocus) {
                          currentScope.unfocus();
                        }
                        signUpWithEmail();
                      },
                      buttonColor: newAppBlue,
                      buttonTitle: 'Continue',
                    ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        normalText('or', context),
        const SizedBox(height: 24),
        const BuildButtonWithIcon(
          buttonColor: fullWhite,
          buttonTitle: 'Continue with Google',
          titleColor: fullWhite,
        ),
      ],
    );
  }

  Future signUpWithEmail() async {
    enableValidate();
    signUpKey.currentState?.save;
    if (!signUpKey.currentState!.validate()) return;
    showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(
            color: newAppBlue,
          ),
        ));
    setState(() {
      isLoadingSignUp = true;
    });
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      String error = 'Error';
      if (e.code == 'weak-password') {
        error = 'The password provided is too weak.';
        print(e);
      } else if (e.code == 'email-already-in-use') {
        error = 'The account already exists for that email.';
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
      return;
    } finally {
      setState(() {
        isLoadingSignUp = false;
        Navigator.of(context).pop();
      });
    }
  }
}
