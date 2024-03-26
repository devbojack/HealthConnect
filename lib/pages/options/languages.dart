// import 'package:flutter/material.dart';
// import '../../model/languages_data.dart';
// import '../../widgets/country_flag.dart';
// import '../../widgets/loading_sb.dart';
// import '../../widgets/my_background.dart';
// import 'package:flag/flag.dart';
// import 'package:overlay_support/overlay_support.dart';
// import '../../widgets/options_app_bar.dart';
// import '../../widgets/text_icon_widgets.dart';
//
// class LanguagePage extends StatefulWidget {
//   const LanguagePage({super.key});
//
//   @override
//   State<LanguagePage> createState() => _LanguagePageState();
// }
//
// class _LanguagePageState extends State<LanguagePage> {
//   bool _isLoading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     ScrollController scrollController = ScrollController();
//     return MyBackground(
//       child: SafeArea(
//         child: Scaffold(
//           appBar: secAppBar('Languages', context),
//           body: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//             child: _isLoading
//                 ? const SbLoading()
//                 : ListView.builder(
//                     controller: scrollController,
//                     physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
//                     shrinkWrap: true,
//                     itemCount: languagesContent.length,
//                     itemBuilder: (_, index) {
//                       return buildLanguageContainer(
//                         languagesContent[index].flagCode,
//                         languagesContent[index].languageNames,
//                         languagesContent[index].isSelected,
//                       );
//                     }),
//           ),
//         ),
//       ),
//     );
//   }
//
//   buildLanguageContainer(String flagCode, String countryName, bool isSelected) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         GestureDetector(
//           behavior: HitTestBehavior.translucent,
//           onTap: () => showError(),
//           child: Container(
//             width: double.infinity,
//             padding: const EdgeInsets.only(top: 10, bottom: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Expanded(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                           height: 16,
//                           width: 16,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(100)),
//                           child: flagCode.contains('england')
//                               ? Container(
//                                   width: 18,
//                                   height: 13,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     image: DecorationImage(
//                                       image: countryFlag(flagCode),
//                                       fit: BoxFit.fitWidth,
//                                     ),
//                                   ),
//                                 )
//                               : Flag.fromString(
//                                   flagCode,
//                                   fit: BoxFit.contain,
//                                   replacement: Image.asset('lib/assets/flag_assets/world.png'),
//                                 )),
//                       const SizedBox(width: 16),
//                       Flexible(
//                         child: normalText(countryName, context),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Spacer(),
//                 isSelected
//                     ? Icon(Icons.check, size: 18, color: Theme.of(context).dividerColor,)
//                     : Container(width: 1),
//               ],
//             ),
//           ),
//         ),
//         Divider(indent: 28, endIndent: 28, color: Theme.of(context).highlightColor,)
//       ],
//     );
//   }
//
//
//
//   showError() async {
//     setState(() {
//       _isLoading = true;
//     });
//     return await Future.delayed(const Duration(milliseconds: 6000))
//         .then((value) {
//       setState(() {
//         _isLoading = false;
//       });
//       showSimpleNotification(
//           const Align(
//             alignment: Alignment.center,
//             child: Text(
//               'Error',
//               textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.white, fontSize: 12),
//             ),
//           ),
//           contentPadding: const EdgeInsets.symmetric(vertical: 16),
//           slideDismiss: true,
//           background: const Color(0xffDB4437));
//     });
//   }
// }
