import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData lightTheme() => ThemeData(
        primarySwatch: Colors.red,
        textTheme: GoogleFonts.openSansTextTheme(),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.amber,
          primarySwatch: Colors.red,
          brightness: Brightness.light,
        ),
      );

  static ThemeData darkTheme() => ThemeData(
        primarySwatch: Colors.red,
        textTheme: GoogleFonts.openSansTextTheme(),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.amber,
          primarySwatch: Colors.red,
          brightness: Brightness.dark,
        ),
      );
}
