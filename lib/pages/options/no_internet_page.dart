import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthconnect/constants/image_constants.dart';
import 'package:healthconnect/provider/size_config.dart';
import 'package:healthconnect/widgets/build_button.dart';
import 'package:healthconnect/widgets/my_background.dart';
import 'package:healthconnect/widgets/text_icon_widgets.dart';
import 'package:lottie/lottie.dart';
import '../../constants/new_color_constants.dart';
import '../../widgets/loading_sb.dart';

class NoInternetPage extends StatefulWidget {
  const NoInternetPage({required this.onRefreshScreen, super.key});

  final Future<void> onRefreshScreen;

  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double mHeight = SizeConfig.blockSizeH!;
    double mWidth = SizeConfig.blockSizeW!;
    return MyBackground(
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: mHeight * 16,
                    child: Icon(Icons.info_outlined,
                        color: Theme.of(context).dividerColor)),
                const SizedBox(height: 32),
                veryBigTextBold('Something Went Wrong!', mHeight, context),
                const SizedBox(height: 8),
                SizedBox(
                    width: mWidth * 20,
                    child: Divider(
                        color: Theme.of(context).dividerColor.withOpacity(0.7),
                        thickness: 1)),
                const SizedBox(height: 24),
                SizedBox(
                  child: Text('Please Try Reloading.',
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).dividerColor.withOpacity(0.8),
                      ),
                      textAlign: TextAlign.center),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 16),
                    width: SizeConfig.blockSizeW! * 80,
                    child: BuildButton(
                      onPressed: _animatedCheckNetIcon,
                      buttonColor: Theme.of(context).primaryColor,
                      buttonTitle: 'Retry',
                    )),
                SizedBox(height: mHeight * 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _animatedCheckNetIcon() async {
    widget.onRefreshScreen;
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(seconds: 4)).then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }
}
