import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthconnect/provider/size_config.dart';
import 'package:healthconnect/widgets/text_icon_widgets.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import '../constants/image_constants.dart';
import '../constants/new_color_constants.dart';
import '../pages/signing/google_signin_provider.dart';

class BuildButton extends StatelessWidget {
  const BuildButton(
      {required this.onPressed,
      required this.buttonColor,
      required this.buttonTitle,
      super.key});

  final VoidCallback onPressed;
  final Color buttonColor;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double mWidth = SizeConfig.blockSizeW!;
    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [appGradientOne, appGradientTwo]),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.12),
                offset: const Offset(-0, 4),
                blurRadius: 6.0,
                spreadRadius: 0),
          ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          minimumSize: const Size(300, 44),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
        ),
        child: buttonText(buttonTitle, context),
      ),
    );
  }
}

class NonBlueButton extends StatelessWidget {
  const NonBlueButton(
      {required this.onPressed,
      required this.buttonColor,
      required this.buttonTitle,
      required this.titleColor,
      super.key});

  final VoidCallback onPressed;
  final Color buttonColor;
  final String buttonTitle;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double mWidth = SizeConfig.blockSizeW!;
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 32)),
          backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          minimumSize: MaterialStateProperty.all(const Size(300, 42)),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return buttonColor;
              }
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed)) {
                return Colors.blue.withOpacity(0.0);
              }
              return null; // Defer to the widget's default.
            },
          ),
        ),
        child: buttonColoredText(buttonTitle, titleColor));
  }
}

class BuildSmallRoundButton extends StatelessWidget {
  const BuildSmallRoundButton(
      {required this.onPressed,
        required this.buttonColor,
        required this.buttonTitle,
        required this.titleColor,
        super.key});

  final VoidCallback onPressed;
  final Color buttonColor;
  final String buttonTitle;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          elevation: 5,
          minimumSize: const Size(150, 42),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))
      ),
      child: buttonColoredText(buttonTitle, titleColor),
    );
  }
}

class BuildSmallButton extends StatelessWidget {
  const BuildSmallButton(
      {required this.onPressed,
      required this.buttonColor,
      required this.buttonTitle,
      required this.titleColor,
      super.key});

  final VoidCallback onPressed;
  final Color buttonColor;
  final String buttonTitle;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 32)),
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        minimumSize: MaterialStateProperty.all(const Size(100, 32)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return buttonColor;
            }
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.pressed)) {
              return Colors.blue.withOpacity(0.12);
            }
            return null; // Defer to the widget's default.
          },
        ),
      ),
        child: buttonColoredText(buttonTitle, titleColor),
    );
  }
}

class BuildButtonWithIcon extends StatelessWidget {
  const BuildButtonWithIcon(
      {required this.buttonColor,
      required this.buttonTitle,
      required this.titleColor,
      super.key});

  final Color buttonColor;
  final String buttonTitle;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double mWidth = SizeConfig.blockSizeW!;
    return ElevatedButton(
      onPressed: () {
        final provider =
            Provider.of<GoogleSignInProvider>(context, listen: false);
        try {
          provider.googleLogin();
        } catch (e) {
          showSimpleNotification(
            Text(
              e.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 11),
              textAlign: TextAlign.center,
            ),
            contentPadding: const EdgeInsets.all(12),
            background: Colors.red,
          );
          print(e);
        }
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 32)),
        backgroundColor: MaterialStateProperty.all<Color>(fullWhite),
        side: MaterialStateProperty.all(const BorderSide(color: appBlue)),
        minimumSize: MaterialStateProperty.all(const Size(300, 48)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return buttonColor;
            }
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.pressed)) {
              return Colors.blue.withOpacity(0.12);
            }
            return null; // Defer to the widget's default.
          },
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 18,
            width: 18,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(googleLogo), fit: BoxFit.contain),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            buttonTitle,
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
