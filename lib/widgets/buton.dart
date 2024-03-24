import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/assets_constants.dart';
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
        onPressed: onPressed,
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
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isEmail ? AppColors.primaryColor : Colors.white,
        foregroundColor: isEmail ? Colors.white : Colors.black,
        shadowColor: Colors.black.withOpacity(0.4),
        minimumSize: const Size(300, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isEmail
              ? const Icon(Icons.email, size: 20, color: Colors.white)
              : Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetConstants.googleLogo),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
          const SizedBox(width: 12),
          Text(
            isEmail ? 'Continue with Email' : 'Continue with Google',
            style: GoogleFonts.roboto(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: isEmail ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
