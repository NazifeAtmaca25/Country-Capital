import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppTextStyle {
  static const TextStyle title = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle appTittle = TextStyle(
    fontSize: 24,
    color: Colors.white,
  );

  static const TextStyle question = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static final TextStyle answer = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const TextStyle score = TextStyle(
    fontSize: 42,
    fontWeight: FontWeight.bold,
    color: AppColor.gold,
  );

  static final TextStyle homepage = GoogleFonts.poppins(
    fontSize: 52,
    fontWeight: FontWeight.w900,
    color: Colors.white,
    shadows: const [
      Shadow(
        blurRadius: 20,
        color: Colors.black54,
      ),
    ],
  );

  static const TextStyle buton = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w900,
    color: Color(0xFF121212),
    letterSpacing: 1.2,
  );
}