import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:healthconnect/constants/color_constants.dart';

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

  initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    currentTheme = prefs.getString("theme") ?? "system";
    notifyListeners();
  }
}

class MyThemes {
  static final lightTheme = ThemeData(
    primaryColor: ColorConstants.appBlue,
    scaffoldBackgroundColor: ColorConstants.lightBackground,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.roboto(
        fontSize: 20,
        color: ColorConstants.lightTextColor,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: 15,
        color: ColorConstants.lightTextColor,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.roboto(
        fontSize: 14,
        color: ColorConstants.lightTextColor,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 14,
        color: ColorConstants.lightTextColor,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 12,
        color: ColorConstants.lightTextColor,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: 11,
        color: ColorConstants.lightTextColor,
        fontWeight: FontWeight.normal,
      ),
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: ColorConstants.lightTextColor),
    cardColor: Color(0xffe3f2fd),
    disabledColor: Colors.black.withOpacity(0.65),
    colorScheme: ColorScheme.fromSwatch().copyWith(brightness: Brightness.dark),
    // hoverColor: Colors.black,
    iconTheme: const IconThemeData(color: ColorConstants.lightTextColor),
    // shadowColor: tipsCardShadowColorLight,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorConstants.lightBackground,
        systemNavigationBarColor: ColorConstants.lightBackground,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Color(0xffe3f2fd),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Color(0xffe3f2fd),
    ),
    dividerColor: ColorConstants.lightTextColor,
  );

  static final darkTheme = ThemeData(
    primaryColor: ColorConstants.appBlue,
    // scaffoldBackgroundColor: ColorConstants.darkBackground,
    scaffoldBackgroundColor: const Color(0xff0F141A),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.roboto(
        fontSize: 20,
        color: ColorConstants.darkTextColor,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: 16,
        color: ColorConstants.darkTextColor,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.roboto(
        fontSize: 14,
        color: ColorConstants.darkTextColor,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 14,
        color: ColorConstants.darkTextColor,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 12,
        color: ColorConstants.darkTextColor,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: 11,
        color: ColorConstants.darkTextColor,
        fontWeight: FontWeight.normal,
      ),
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: ColorConstants.darkTextColor),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(brightness: Brightness.light),
    cardColor: const Color(0xff1B2026),
    disabledColor: Colors.white.withOpacity(0.65),
    // canvasColor: tipsContainerColorDark,
    // hoverColor: cardBorderColorDark,
    // highlightColor: whitishWhiteColor,
    dividerColor: ColorConstants.darkTextColor,
    // secondaryHeaderColor: chosenTipsContainerDark,
    // hintColor: matchStartTimeDark,
    // shadowColor: tipsCardShadowColorDark,
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xff0b132b)),
    appBarTheme: AppBarTheme(
      color: ColorConstants.darkBackground,
      elevation: 0,
      centerTitle: true,
      foregroundColor: ColorConstants.darkTextColor,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: ColorConstants.darkBackground,
        systemNavigationBarColor: ColorConstants.darkBackground,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Color(0xff0b132b),
    ),
  );
}
