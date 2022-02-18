import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme with ChangeNotifier {

  Color get blue => const Color.fromARGB(255, 70, 96, 224);
  Color get green => const Color(0xFF00C569);
  Color get red => const Color(0xFFFF5555);
  Color get primary => const Color(0xFF64ffda);
  Color get lightOne => const Color(0xFF8892b0);
  Color get lightTwo => const Color(0xFFa8b2d1);
  Color get lightThree => const Color(0xFFccd6f6);
  Color get darkOne => const Color(0xFF0a192f);
  Color get darkTwo => const Color(0xFF112240);
  Color get darkThree => const Color(0xFF233554);
  ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: GoogleFonts.robotoSlab().fontFamily,
    colorScheme: _appColorScheme,
    textTheme: GoogleFonts.robotoSlabTextTheme(Typography.whiteRedmond),
    backgroundColor: const Color(0xFF0a192f),
    scaffoldBackgroundColor: const Color(0xFF0a192f),
    inputDecorationTheme: const InputDecorationTheme(
      isDense: true,
      border: InputBorder.none
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        minimumSize: const Size(140, 40),
        textStyle: GoogleFonts.robotoSlab(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      )
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
        minimumSize: const Size(140, 40),
        textStyle: GoogleFonts.robotoSlab(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      )
    ),
  );
}

ColorScheme _appColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF64ffda),
  brightness: Brightness.dark,
  primary: const Color(0xFF64ffda),
  onPrimary: const Color(0xFFccd6f6),
  secondary: const Color(0xFFccd6f6),
  onSecondary: const Color(0xFF0a192f),
  error: const Color(0xFFFF5555),
  onError: const Color(0xFFccd6f6),
  background: const Color(0xFF0a192f),
  onBackground: const Color(0xFFccd6f6),
  surface: const Color(0xFF0a192f),
  onSurface: const Color(0xFFccd6f6),
  // onSurface: const Color(0xFF64ffda),
);