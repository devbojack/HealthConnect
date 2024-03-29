import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthconnect/constants/color_constants.dart';
import 'package:healthconnect/pages/options/privacy_policy.dart';
import 'package:healthconnect/provider/theme_provider.dart';
import 'package:healthconnect/widgets/text_icon_widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/new_color_constants.dart';
import '../../main.dart';
import '../../widgets/home_appbar.dart';
import '../../widgets/my_background.dart';
import '../options/contact_us.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage(
      {required this.mHeight,
      required this.mWidth,
      required this.isTablet,
      super.key});

  final double mHeight;
  final double mWidth;
  final bool isTablet;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool status = isNotificationOn;
  final ScrollController _scrollController = ScrollController();
  bool isSwitchedOn = false;
  bool isSigningOut = false;

  ///_____________________________________________________set on or off notification

  Future setNotificationOnOff(value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref = await SharedPreferences.getInstance();
    isNotificationOn = await pref.setBool('notifyMe', value);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 100),
      key: Key(Theme.of(context).brightness.toString()),
      child: MyBackground(
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: homeAppBar(context),
            body: Padding(
              padding: widget.isTablet
                  ? const EdgeInsets.symmetric(horizontal: 32, vertical: 8)
                  : const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //_____________________________________________________________NOTIFICATIONS
                    _buildTitle('Notifications', context),
                    myDiv(context),
                    moreSettings(
                        widget.mHeight,
                        notificationColor,
                        Icons.notifications_none_outlined,
                        'Notifications',
                        Switch(
                            activeColor: Colors.white,
                            activeTrackColor: Theme.of(context).primaryColor,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Theme.of(context).brightness == Brightness.dark ? Colors.black.withOpacity(0.3) : Colors.white.withOpacity(0.3),
                            value: status,
                            onChanged: (value) {
                              setState(() {
                                setNotificationOn(value);
                                status = value;
                              });
                            })),
                    // _____________________________________________________________DARK MODE
                    _buildTitle('Appearance', context),
                    myDiv(context),
                    moreSettings(
                      widget.mHeight,
                      themeColor,
                      Icons.dark_mode_outlined,
                      'Theme Mode',
                      Consumer<ThemeProvider>(
                          builder: (context, provider, child) {
                        return DropdownButton(
                            iconEnabledColor: Theme.of(context).dividerColor,
                            value: provider.currentTheme,
                            items: [
                              DropdownMenuItem<String>(
                                value: 'light',
                                child: normalText(' Light', context),
                              ),
                              DropdownMenuItem<String>(
                                value: 'dark',
                                child: normalText(' Dark', context),
                              ),
                              DropdownMenuItem<String>(
                                value: 'system',
                                child: normalText(' System', context),
                              ),
                            ],
                            onChanged: (String? value) {
                              provider.changeTheme(value ?? 'system');
                            });
                      }),
                    ),
                    //____________________________________________________________LANGUAGES
                    // _buildTitle('Languages', context),
                    // myDiv(context),
                    // GestureDetector(
                    //   behavior: HitTestBehavior.translucent,
                    //   onTap: () {
                    //     Navigator.of(context).push(PageTransition(
                    //         type: PageTransitionType.fade,
                    //         child: const LanguagePage()));
                    //   },
                    //   child:
                    // moreSettings(
                    //     widget.mHeight,
                    //     languageColor,
                    //     Icons.privacy_tip_outlined,
                    //     'Unavailable (Version $appVersion)',
                    //     Container(color: Colors.transparent)),
                    // ),
                    //_____________________________________________________________CONTACT US
                    _buildTitle('Contact us', context),
                    myDiv(context),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(context,
                            screen: const ContactUsPage(),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino);
                      },
                      //____________________________________________________________WRITE TO US
                      child: moreSettings(
                        widget.mHeight,
                        writeUsColor,
                        Icons.mail_outline_rounded,
                        'Write to us',
                        forwardIcon(context),
                      ),
                    ),
                    const Divider(color: Colors.transparent),
                    //_____________________________________________________________PRIVACY POLICY
                    _buildTitle('Privacy policy', context),
                    myDiv(context),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.of(context).push(PageTransition(
                            type: PageTransitionType.fade,
                            child: const PrivacyPolicyPage()));
                      },
                      child: moreSettings(
                          widget.mHeight,
                          privacyPolicyColor,
                          Icons.privacy_tip_outlined,
                          'Privacy policy',
                          forwardIcon(context)),
                    ),
                    const SizedBox(height: 16),

                    ///____________________________________________________________ACCOUNT
                    // _buildTitle('Account', context),

                    // myDiv(context),
                    const Divider(color: Colors.transparent),
                    const SizedBox(height: 8),
                    isSigningOut
                        ? const SizedBox(
                            width: double.infinity,
                            child: Center(
                              child:
                                  CircularProgressIndicator(color: newAppBlue),
                            ),
                          )
                        : signOutButton(),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //_____________________________________________________________________________Build More Title
  Widget _buildTitle(String title, BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 4),
      child: normalSizeBoldText(title, 13, context));

  ///_____________________________________________________________________________Build Divider
  Divider myDiv(BuildContext context) =>
      Divider(color: Theme.of(context).dividerColor.withOpacity(0.6));

  ///______________________________________________________________________________Contact us
  Widget moreSettings(double mHeight, Color boxColor, IconData leadingIcon,
          String moreSettings, Widget widget) =>
      Container(
        padding: const EdgeInsets.only(top: 6, bottom: 0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(leadingIcon, color: fullWhite, size: 16),
            ),
            const SizedBox(width: 16),
            Text(moreSettings,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).dividerColor,
                )),
            const Spacer(),
            widget
          ],
        ),
      );

  Widget signOutButton() => Container(
        padding: const EdgeInsets.only(top: 4, bottom: 0),
        child: GestureDetector(
          onTap: signOut,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              bigNormalBoldColoredText('Sign out', ColorConstants.appBlue)
            ],
          ),
        ),
      );

  Future signOut() async {
    setState(() {
      isSigningOut = true;
    });
    // final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    try {
      // provider.logout();
    } finally {
      setState(() {
        isSigningOut = false;
      });
    }
  }
}

///____________________________________________________________________________Language Forward arrow
///_____________________________________________________________________________Forward arrow
Widget extendedForwardIcon(String text, BuildContext context) => Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        smallText(text, context),
        const SizedBox(width: 4),
        Icon(Icons.arrow_forward_ios_rounded,
            color: Theme.of(context).highlightColor, size: 20),
      ],
    );

///_____________________________________________________________________________Forward arrow
Widget forwardIcon(BuildContext context) =>
    Icon(Icons.arrow_forward_ios_rounded,
        color: Theme.of(context).dividerColor.withOpacity(0.5), size: 20);

///_____________________________________________________________________________set notify me
Future setNotificationOn(value) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  isNotificationOn = await pref.setBool('notifyMe', value);
}
