import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lib/constants/assets_constants.dart';
import '../providers/size_config.dart';
import '../theme/colors.dart';

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

    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            shadowColor: Colors.black,
            minimumSize: const Size(300, 48),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: Text(
          buttonTitle,
          style: const TextStyle(color: Colors.white),
        ));
  }
}

class BuildButtonWithIcon extends StatelessWidget {
  const BuildButtonWithIcon(
      {required this.onPressed, required this.isEmail, super.key});

  final VoidCallback onPressed;
  final bool isEmail;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double mWidth = SizeConfig.blockSizeW!;
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 32)),
        backgroundColor: isEmail
            ? MaterialStateProperty.all<Color>(AppColors.primaryColor)
            : MaterialStateProperty.all<Color>(Colors.white),
        side: MaterialStateProperty.all(
            BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.3))),
        minimumSize: MaterialStateProperty.all(const Size(300, 48)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return isEmail
                  ? AppColors.primaryColor.withOpacity(0.3)
                  : Colors.white.withOpacity(0.3);
            }
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.pressed)) {
              return isEmail ? AppColors.primaryColor : Colors.white;
            }
            return null; // Defer to the widget's default.
          },
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isEmail
              ? const Icon(Icons.email, size: 18, color: Colors.white)
              : Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(googleLogo), fit: BoxFit.contain),
                  ),
                ),
          const SizedBox(width: 12),
          Text(
            isEmail ? 'Continue with Email' : 'Continue with Google',
            style: GoogleFonts.roboto(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: isEmail ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
