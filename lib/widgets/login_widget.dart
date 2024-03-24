import 'package:flutter/material.dart';
import 'package:healthconnect/widgets/auth_field_widgets.dart';
import 'package:healthconnect/widgets/buton.dart';
import 'package:healthconnect/widgets/text.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> signInKey = GlobalKey<FormState>();
  late AutovalidateMode myAutoValidate;

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
          key: signInKey,
          child: Column(
            children: [
              AuthEmail(
                  emailController: emailController,
                  autoValidateMode: myAutoValidate),
              AuthPassword(
                passwordController: passwordController,
                autoValidateMode: myAutoValidate,
                isSigningIn: true,
              ),
              forgotPasswordText(),
              const SizedBox(height: 24),
              BuildButton(
                onPressed: () {
                  currentScope = FocusScope.of(context);
                  if (currentScope.hasPrimaryFocus || currentScope.hasFocus) {
                    currentScope.unfocus();
                  }
                  // signInWithEmail();
                },
                buttonColor: Theme.of(context).primaryColor,
                buttonTitle: 'Continue',
              ),
            ],
          ),
        ),
        const SizedBox(height: 24)
      ],
    );
  }
}

///_________________________________________________________________________________________________WIDGETS
forgotPasswordText() => SizedBox(
      width: double.infinity,
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {},
          // => Navigator.of(context).push(
          //     MaterialPageRoute(builder: (_) => const ForgotPassword())),
          child: normalBoldColoredText('Reset Password', Colors.red),
        ),
      ),
    );

//_____________________________________________________________________________SIGN IN WITH EMAIL
  // Future<void> signInWithEmail() async {
  //   enableValidate();
  //   signInKey.currentState?.save();
  //   if (!signInKey.currentState!.validate()) return;
  //   showDialog(
  //       context: context,
  //       builder: (context) => const Center(
  //             child: CircularProgressIndicator(
  //               color: Theme.of(context).primaryColor,
  //             ),
  //           ));
    // FirebaseAuth auth = FirebaseAuth.instance;
    // try {
    //   await auth.signInWithEmailAndPassword(
    //     email: emailController.text.trim(),
    //     password: passwordController.text.trim(),
    //   );
    // } on FirebaseAuthException catch (e) {
    //   String error = '';
    //   if (e.code == 'user-not-found') {
    //     error = 'No user found for that email.';
    //   } else if (e.code == 'wrong-password') {
    //     error = 'Wrong password provided for that user.';
    //   } else {
    //     error = e.toString();
    //   }
    //   showSimpleNotification(
    //     Text(
    //       error,
    //       style: const TextStyle(color: Colors.white, fontSize: 11),
    //       textAlign: TextAlign.center,
    //     ),
    //     contentPadding: const EdgeInsets.all(12),
    //     background: Colors.red,
    //   );
    // } finally {
    //   if (context.mounted) Navigator.of(context).pop();
    // }
  // }
// }