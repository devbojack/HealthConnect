import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthconnect/constants/new_color_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  String currentTheme = 'system';

  ThemeMode get themeMode {
    if (currentTheme == 'light') {
      return ThemeMode.light;
    } else if (currentTheme == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  changeTheme(String theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("theme", theme);

    currentTheme = theme;
    notifyListeners();
  }
  initialize() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    currentTheme = prefs.getString("theme") ?? "system";
    notifyListeners();
  }
}

class MyThemes {
  static final lightTheme = ThemeData(
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: darkBackground),
    scaffoldBackgroundColor: whiteColor,
    cardColor: cardColorLight,
    colorScheme: ColorScheme.fromSwatch().copyWith(brightness: Brightness.dark),
    primaryColor: newAppBlue,
    hoverColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.black),
    shadowColor: tipsCardShadowColorLight,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: fullWhite,
        systemNavigationBarColor: fullWhite,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    navigationBarTheme:
        const NavigationBarThemeData(backgroundColor: whiteColor),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.transparent,
    ),
    highlightColor: blackishBlackColor,
    disabledColor: inActiveIconLight,
    canvasColor: tipsContainerColorLight,
    dividerColor: Colors.black,
    secondaryHeaderColor: tipsContainerColorLight,
    hintColor: newGreenishColor,

  );
  static final darkTheme = ThemeData(
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: whiteColor),
    scaffoldBackgroundColor: darkBackground,
    cardColor: cardColorDark,
    primaryColor: newAppBlue,
    disabledColor: inActiveIconDark,
    canvasColor: tipsContainerColorDark,
    hoverColor: cardBorderColorDark,
    highlightColor: whitishWhiteColor,
    dividerColor: whiteColor,
    secondaryHeaderColor: chosenTipsContainerDark,
    hintColor: matchStartTimeDark,
    shadowColor: tipsCardShadowColorDark,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(brightness: Brightness.light),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.transparent),
    appBarTheme: AppBarTheme(
      color: darkBackground,
      elevation: 0,
      centerTitle: true,
      foregroundColor: whiteColor,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: darkBackground,
        systemNavigationBarColor: darkBackground,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ),
    navigationBarTheme:
        const NavigationBarThemeData(backgroundColor: darkBackground),
  );
}
