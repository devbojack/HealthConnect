import 'package:email_validator/email_validator.dart';
import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:flutter/material.dart';
import 'package:healthconnect/widgets/buton.dart';
import 'package:healthconnect/widgets/input_decoration.dart';

class AuthEmail extends StatelessWidget {
  const AuthEmail(
      {super.key,
      required this.emailController,
      required this.autoValidateMode});

  final TextEditingController emailController;
  final AutovalidateMode autoValidateMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: emailController,
        style: TextStyle(color: Theme.of(context).indicatorColor),
        autovalidateMode: autoValidateMode,
        decoration: inputDecoration('Enter your email address', context),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (!EmailValidator.validate(value!)) {
            return 'Please enter a valid email';
          } else {
            null;
          }
          return null;
        },
      ),
    );
  }
}

class AuthPassword extends StatelessWidget {
  const AuthPassword(
      {super.key,
      required this.passwordController,
      required this.autoValidateMode,
      required this.isSigningIn});

  final TextEditingController passwordController;
  final AutovalidateMode autoValidateMode;
  final bool isSigningIn;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        child: isSigningIn
            ? FancyPasswordField(
                controller: passwordController,
                autovalidateMode: autoValidateMode,
                showPasswordIcon: Icon(
                  Icons.visibility_rounded,
                  size: 18,
                  color: Theme.of(context).dividerColor,
                ),
                hidePasswordIcon: Icon(
                  Icons.visibility_off,
                  size: 18,
                  color: Theme.of(context).dividerColor,
                ),
                hasStrengthIndicator: false,
                autocorrect: false,
                style: TextStyle(color: Theme.of(context).indicatorColor, fontSize: 12),
                decoration: inputDecoration('Enter Password', context),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a password";
                  }
                  return null;
                },
              )
            : FancyPasswordField(
                style: TextStyle(color: Theme.of(context).indicatorColor, fontSize: 12),
                controller: passwordController,
                showPasswordIcon: Icon(
                  Icons.visibility_rounded,
                  size: 18,
                  color: Theme.of(context).dividerColor,
                ),
                hidePasswordIcon: Icon(
                  Icons.visibility_off,
                  size: 18,
                  color: Theme.of(context).dividerColor,
                ),
                autovalidateMode: autoValidateMode,
                decoration: inputDecoration('Enter Password', context),
                autocorrect: false,
                hasShowHidePassword: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a password";
                  } else if (value.length < 6) {
                    return "Password is too short";
                  }
                  return null;
                },
              ));
  }
}

class CreateAccountButton extends StatefulWidget {
  const CreateAccountButton(
      {super.key,
      required this.isLoading,
      required this.email,
      required this.password});

  final bool isLoading;
  final String email, password;

  @override
  State<CreateAccountButton> createState() => _CreateAccountButtonState();
}

class _CreateAccountButtonState extends State<CreateAccountButton> {
  @override
  Widget build(BuildContext context) {
    return BuildButton(
      onPressed: () {},
      buttonColor: Theme.of(context).indicatorColor,
      buttonTitle: 'Continue',
    );
  }
}

class LoginButton extends StatefulWidget {
  const LoginButton(
      {super.key,
      required this.isLoading,
      required this.email,
      required this.password});

  final bool isLoading;
  final String email, password;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return BuildButton(
      onPressed: () {},
      buttonColor: Theme.of(context).indicatorColor,
      buttonTitle: 'Continue',
    );
  }
}
