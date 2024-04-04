// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:healthconnect/identifications/secret_ids.dart';
// import 'package:healthconnect/widgets/my_background.dart';

// class EditProfile extends StatefulWidget {
//   const EditProfile({super.key});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   @override
//   Widget build(BuildContext context) {
//     return MyBackground(
//       child: SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             automaticallyImplyLeading: false,
//             elevation: 0,
//             bottomOpacity: 0,
//             scrolledUnderElevation: 0,
//             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Edit Profile',
//                   style: GoogleFonts.roboto(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w600,
//                       color: Theme.of(context).dividerColor),
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Text(
//                     'Save  ',
//                     style: GoogleFonts.roboto(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Theme.of(context).primaryColor),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           body: ListView(
//             children: [
//               Container(
//                     height: 150,
//                     width: 150,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(100),
//                       image: const DecorationImage(
//                         image: AssetImage(UserData.userPic),
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 32),
//                   C
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
