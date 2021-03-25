import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var happyAnimalsThemeData = ThemeData(

    backgroundColor: kHaBgYellow,
    accentColor: kHaPink,
    primaryColor: kHaBlueLight,

    textTheme: GoogleFonts.sourceSansProTextTheme().copyWith(
      headline1: GoogleFonts.muli().copyWith(
        fontWeight: FontWeight.normal,
        color: Colors.black87
      ),
      headline4: GoogleFonts.muli().copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: kHaBrown
      ),

    )
);

const kHaBrown = Color(0xFF5b2018);
const kHaYellowLight = Color(0xFFffffcd);
const kHaBgYellow = Color(0xffFFFEF9);
const kHaBlueLight = Color(0xffacd2d0);
const kHaPink = Color(0xffdd595d);
const kHaBlueDark = Color(0xff84b0aa);
const kHaYellowDark = Color(0xffffe782);
