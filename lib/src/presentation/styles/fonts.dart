import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fonts {
  const Fonts._();

  static final h1 = GoogleFonts.ubuntu(
    textStyle: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
    ),
  );

  static final h2 = GoogleFonts.ubuntu(
    textStyle: const TextStyle(
      fontSize: 22,
    ),
  );

  static final b1 = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 17,
    ),
  );

  static final b2 = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 15,
    ),
  );

  static final b3 = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 13,
    ),
  );
}
