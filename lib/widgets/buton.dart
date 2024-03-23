import 'package:flutter/material.dart';

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
    
        return  ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          shadowColor: Colors.black,
          minimumSize: const Size(300, 48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
        ),
        child: Text(buttonTitle, style: const TextStyle(color: Colors.white),)
    );
  }
}


// class BuildButtonWithIcon extends StatelessWidget {
//   const BuildButtonWithIcon(
//       {required this.buttonColor,
//       required this.buttonTitle,
//       required this.titleColor,
//       super.key});

//   final Color buttonColor;
//   final String buttonTitle;
//   final Color titleColor;

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     double mWidth = SizeConfig.blockSizeW!;
//     return ElevatedButton(
//       onPressed: () {
//         final provider =
//             Provider.of<GoogleSignInProvider>(context, listen: false);
//         try {
//           provider.googleLogin();
//         } catch (e) {
//           showSimpleNotification(
//             Text(
//               e.toString(),
//               style: const TextStyle(color: Colors.white, fontSize: 11),
//               textAlign: TextAlign.center,
//             ),
//             contentPadding: const EdgeInsets.all(12),
//             background: Colors.red,
//           );
//           print(e);
//         }
//       },
//       style: ButtonStyle(
//         padding: MaterialStateProperty.all(
//             const EdgeInsets.symmetric(horizontal: 32)),
//         backgroundColor: MaterialStateProperty.all<Color>(fullWhite),
//         side: MaterialStateProperty.all(const BorderSide(color: appBlue)),
//         minimumSize: MaterialStateProperty.all(const Size(300, 48)),
//         shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
//         overlayColor: MaterialStateProperty.resolveWith<Color?>(
//           (Set<MaterialState> states) {
//             if (states.contains(MaterialState.hovered)) {
//               return buttonColor;
//             }
//             if (states.contains(MaterialState.focused) ||
//                 states.contains(MaterialState.pressed)) {
//               return Colors.blue.withOpacity(0.12);
//             }
//             return null; // Defer to the widget's default.
//           },
//         ),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             height: 18,
//             width: 18,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage(googleLogo), fit: BoxFit.contain),
//             ),
//           ),
//           const SizedBox(width: 12),
//           Text(
//             buttonTitle,
//             style: GoogleFonts.roboto(
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }