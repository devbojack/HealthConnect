
import 'package:flutter/material.dart';
import '../../provider/size_config.dart';
import '../../widgets/build_button.dart';
import '../../widgets/loading_sb.dart';
import '../../widgets/my_background.dart';
import '../../widgets/text_icon_widgets.dart';

class NoInternetConnectionPage extends StatefulWidget {
  const NoInternetConnectionPage({required this.onRefreshScreen, super.key});

  final Future<void> onRefreshScreen;

  @override
  State<NoInternetConnectionPage> createState() => _NoInternetConnectionPageState();
}

class _NoInternetConnectionPageState extends State<NoInternetConnectionPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double mHeight = SizeConfig.blockSizeH!;
    double mWidth = SizeConfig.blockSizeW!;
    return MyBackground(
      child: SafeArea(
        child: Scaffold(
          body: isLoading
              ? const Center(
              child: SbLoading()
          )
              : SizedBox(
            width: double.infinity,
            height: double.infinity,
            // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: mHeight * 2),
                SizedBox(
                    height: mHeight * 16,
                    child:
                    Icon(Icons.info_outline, size: mHeight * 12, color: Theme.of(context).dividerColor,)
                ),
                veryBigTextBold('No Internet Connection', mHeight, context),
                const SizedBox(height: 8),
                SizedBox(
                    width: mWidth * 20,
                    child: Divider(
                        color: Theme.of(context).dividerColor,
                        thickness: 1
                    )),
                const SizedBox(height: 32),
                SizedBox(
                  child: normalText('Please check your Wi-Fi or mobile data network and try again.', context),
                ),
                const SizedBox(height: 32),
                BuildSmallRoundButton(
                  onPressed: _animatedCheckNetIcon,
                  buttonColor: Theme.of(context).dividerColor,
                  buttonTitle: 'Retry',
                  titleColor: Theme.of(context).scaffoldBackgroundColor,
                ),
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