import 'package:flutter/material.dart';
import 'package:healthconnect/widgets/text_icon_widgets.dart';
import '../constants/image_constants.dart';
import '../constants/new_color_constants.dart';

class SbLoading extends StatefulWidget {
  const SbLoading({super.key});

  @override
  State<SbLoading> createState() => _SbLoadingState();
}

class _SbLoadingState extends State<SbLoading> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:   Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: Stack(
              children: [
                const SizedBox(
                  height: 38,
                  child: CircularProgressIndicator(color: newAppBlue),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  child: const Image(
                      image: AssetImage(sbNewLogo), fit: BoxFit.contain),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          normalText('Loading ...', context)
        ],
      ),
    );
  }
}
