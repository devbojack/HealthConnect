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
  initialize() async{
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
    // cardColor: cardColorLight,
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
    navigationBarTheme:
        const NavigationBarThemeData(backgroundColor: ColorConstants.lightBackground,),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.transparent,
    ),
    dividerColor: ColorConstants.lightTextColor,
  );


  static final darkTheme = ThemeData(
    primaryColor: ColorConstants.appBlue,
    scaffoldBackgroundColor: ColorConstants.darkBackground,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.roboto(
        fontSize: 20,
        color: ColorConstants.lightTextColor,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: 16,
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
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: ColorConstants.darkTextColor),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(brightness: Brightness.light),
    // cardColor: cardColorDark,
    // disabledColor: inActiveIconDark,
    // canvasColor: tipsContainerColorDark,
    // hoverColor: cardBorderColorDark,
    // highlightColor: whitishWhiteColor,
    dividerColor: ColorConstants.darkTextColor,
    // secondaryHeaderColor: chosenTipsContainerDark,
    // hintColor: matchStartTimeDark,
    // shadowColor: tipsCardShadowColorDark,
    
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.transparent),
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
    navigationBarTheme:
        const NavigationBarThemeData(backgroundColor: ColorConstants.darkBackground),
  );
}
