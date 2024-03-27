import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthconnect/pages/home/settings_page.dart';
import 'package:healthconnect/pages/signing/verify_email.dart';
import 'package:healthconnect/widgets/my_background.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import '../../constants/new_color_constants.dart';
import '../../provider/size_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.isEmailVerified, super.key});

  final bool isEmailVerified;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///____________________________________________________________________________Class Variables
  late PersistentTabController _controller;
  late PageController _pageController;
  int currentIndex = 0;
  int selectedIndex = 0;
  Timer? timer;
  late bool isEmailVerified;

  List<PersistentBottomNavBarItem> _navBarItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home, color: Theme.of(context).dividerColor),
        inactiveIcon: Icon(
          Icons.home_outlined,
          color: Theme.of(context).disabledColor,
        ),
        iconSize: 22,
        title: ("Today"),
        activeColorPrimary: appBlue,
        inactiveColorPrimary: Theme.of(context).disabledColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings, color: Theme.of(context).dividerColor),
        inactiveIcon: Icon(
          Icons.settings,
          color: Theme.of(context).disabledColor,
        ),
        iconSize: 22,
        title: ("More"),
        activeColorPrimary: appBlue,
        inactiveColorPrimary: Theme.of(context).disabledColor,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    isEmailVerified = widget.isEmailVerified;
    _pageController = PageController(initialPage: selectedIndex);
    _controller = PersistentTabController(initialIndex: currentIndex);
    if (!isEmailVerified) {
      FirebaseAuth.instance.currentUser?.sendEmailVerification();
      timer = Timer.periodic(
          const Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Theme.of(context).dividerColor,
            content: Text(
              "Email Successfully Verified",
              style:
                  TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
            )));
      }
      timer?.cancel();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double mHeight = SizeConfig.blockSizeH!;
    double mWidth = SizeConfig.blockSizeW!;
    bool isTablet = SizeConfig.blockSizeW! > 600;
    return isEmailVerified
        ? MyBackground(
            child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: PersistentTabView(
              context,
              controller: _controller,
              screens: [
                SettingsPage(
                  mHeight: mHeight,
                  mWidth: mWidth,
                  isTablet: isTablet,
                ),
                SettingsPage(
                  mHeight: mHeight,
                  mWidth: mWidth,
                  isTablet: isTablet,
                )
              ],
              items: _navBarItems(context),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              confineInSafeArea: true,
              handleAndroidBackButtonPress: true,
              resizeToAvoidBottomInset: true,
              stateManagement: true,
              hideNavigationBarWhenKeyboardShows: true,
              popAllScreensOnTapOfSelectedTab: true,
              popActionScreens: PopActionScreensType.all,
              itemAnimationProperties: const ItemAnimationProperties(
                duration: Duration(milliseconds: 100),
                curve: Curves.ease,
              ),
              screenTransitionAnimation: const ScreenTransitionAnimation(
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds: 100),
              ),
              navBarStyle: NavBarStyle.style13,
            ),
          ))
        : const VerifyEmail();
  }
}
