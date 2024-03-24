import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthconnect/theme/colors.dart';
// import 'package:shared_preferences/shared_preferences.dart';

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

//   changeTheme(String theme) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString("theme", theme);

//     currentTheme = theme;
//     notifyListeners();
//   }
//   initialize() async{
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     currentTheme = prefs.getString("theme") ?? "system";
//     notifyListeners();
//   }
// }
}

class MyThemes {
  static final lightTheme = ThemeData(
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: DarkTheme.backgroundColor),
    scaffoldBackgroundColor: LightTheme.backgroundColor,
    // cardColor: AppColors.fullWhite,
    colorScheme: ColorScheme.fromSwatch().copyWith(brightness: Brightness.dark),
    primaryColor: AppColors.primaryColor,
    // hoverColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.black),
    shadowColor: LightTheme.blackVeryLightColor,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: LightTheme.backgroundColor,
        systemNavigationBarColor: LightTheme.backgroundColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: LightTheme.backgroundColor),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.transparent,
    ),
    highlightColor: AppColors.primaryColor,
    // disabledColor: inActiveIconLight,
    // canvasColor: tipsContainerColorLight,
    dividerColor: Colors.black,
    // secondaryHeaderColor: tipsContainerColorLight,
    // hintColor: newGreenishColor,
  );

  static final darkTheme = ThemeData(
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.fullWhite),
    scaffoldBackgroundColor: DarkTheme.backgroundColor,
    // cardColor: cardColorDark,
    primaryColor: AppColors.primaryColor,
    // disabledColor: inActiveIconDark,
    // canvasColor: tipsContainerColorDark,
    // hoverColor: cardBorderColorDark,
    // highlightColor: whitishWhiteColor,
    dividerColor: DarkTheme.whiteMediumColor,
    // secondaryHeaderColor: chosenTipsContainerDark,
    // hintColor: matchStartTimeDark,
    shadowColor: LightTheme.blackHeavyColor,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(brightness: Brightness.light),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.transparent),
    appBarTheme: AppBarTheme(
      color: DarkTheme.backgroundColor,
      elevation: 0,
      centerTitle: true,
      foregroundColor: DarkTheme.whiteMediumColor,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: DarkTheme.backgroundColor,
        systemNavigationBarColor: DarkTheme.backgroundColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ),
    navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: DarkTheme.backgroundColor),
  );
}
