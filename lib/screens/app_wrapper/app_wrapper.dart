// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:surebets/pages/home/bets_loading_page.dart';
// import 'package:surebets/pages/home/home_page.dart';
// import 'package:surebets/pages/signing/introduction_page.dart';
// import 'package:surebets/widgets/my_background.dart';
// import 'package:surebets/widgets/text_icon_widgets.dart';

// class AppWrapper extends StatefulWidget {
//   const AppWrapper({super.key});

//   @override
//   State<AppWrapper> createState() => _AppWrapperState();
// }

// class _AppWrapperState extends State<AppWrapper> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, AsyncSnapshot<User?> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const LoadingPage();
//         } else if (snapshot.hasError) {
//           return const FirebaseErrorPage();
//         } else if (snapshot.hasData) {
//           if (snapshot.data!.isAnonymous) {
//             FirebaseAuth.instance.signOut();
//             return const IntroductionPage();
//           } else {
//             return HomePage(isEmailVerified: snapshot.data!.emailVerified);
//           }
//         } else {
//           return const IntroductionPage();
//         }
//       },
//     );
//   }
// }

// class FirebaseErrorPage extends StatelessWidget {
//   const FirebaseErrorPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MyBackground(
//       child: Scaffold(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               bigNormalBoldText('Something went wrong', context),
//               const SizedBox(height: 40),
//               normalText('Please restart the application', context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }