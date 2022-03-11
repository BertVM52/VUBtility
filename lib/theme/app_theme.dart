import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vubtility/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  // Light Theme
  static final ThemeData lightTheme = ThemeData.light().copyWith(

    // main colors
    primaryColor: primaryColor,
    focusColor: secondaryColor,
    highlightColor: secondaryColor.withOpacity(0.4),
    canvasColor: bgAccentColorLight,
    cardColor: bgAccentColorLight,

    // background colors
    scaffoldBackgroundColor: bgColorLight,
    backgroundColor: bgColorLight,

    // input fields
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor.withOpacity(0.1), width: 5.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),

    // text theme
    primaryTextTheme: GoogleFonts.muktaTextTheme().copyWith( // TODO: VUB font?
        headline4: const TextStyle( // appBar titles
            color: Colors.white,
            fontSize: 20.0
        ),
        bodyText1: const TextStyle( // normal text
            fontWeight: FontWeight.normal,
            color: Colors.black87,
            fontSize: 17
        ),
        subtitle1: const TextStyle( // subtext
            color: Colors.black54,
            fontSize: 16,
            fontStyle: FontStyle.italic
        )
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData.dark().copyWith(

    // main colors
    primaryColor: primaryColor,
    focusColor: secondaryColor,
    highlightColor: secondaryColor.withOpacity(0.4),
    canvasColor: bgAccentColorDark,
    cardColor: bgAccentColorDark,

    // background colors
    scaffoldBackgroundColor: bgColorDark,
    backgroundColor: bgColorDark,

    // input fields
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor.withOpacity(0.1), width: 5.0),
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    // text theme
    primaryTextTheme: GoogleFonts.muktaTextTheme().copyWith( // TODO: VUB font?
        headline4: const TextStyle( // appBar titles
            color: Colors.white,
            fontSize: 20.0
        ),
        bodyText1: const TextStyle( // normal text
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontSize: 17
        ),
        subtitle1: const TextStyle( // subtext
            color: Colors.white54,
            fontSize: 16,
            fontStyle: FontStyle.italic
        )
    ),
  );
}