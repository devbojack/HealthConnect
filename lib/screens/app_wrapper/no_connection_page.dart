import 'package:healthconnect/providers/size_config.dart';
import 'package:healthconnect/widgets/background.dart';
import '../../widgets/buton.dart';
import '../../widgets/text.dart';
import 'package:flutter/material.dart';


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
              ? Center(
              child: CircularProgressIndicator(color: Theme.of(context).dividerColor,)
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
                BuildButton(
                  onPressed: _animatedCheckNetIcon,
                  buttonColor: Theme.of(context).dividerColor,
                  buttonTitle: 'Retry',
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