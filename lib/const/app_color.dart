import 'dart:ui';

import 'package:flutter/material.dart';

class AppColor {
  // BACKGROUND

  static const Color background = Color(0xFF070B1F);

  static const Color cardBackground = Color(0xFF1A1F4D);

  static const Color secondaryCard = Color(0xFF232B68);

  // BUTTONS

  static const Color buttonWhite = Color(0xFFF4F5FA);

  static const Color buttonBorder = Color(0xFFDBDDF0);

  // SUCCESS

  static const Color success = Color(0xFF22C55E);

  static const Color successDark = Color(0xFF15803D);

  // ERROR

  static const Color error = Color(0xFFEF4444);

  static const Color errorDark = Color(0xFFB91C1C);

  // WARNING / GOLD

  static const Color gold = Color(0xFFFFC107);

  static const Color goldDark = Color(0xFFFF9800);

  // PROGRESS BAR

  static const Color progressActive = Color(0xFF34D399);

  static const Color progressInactive = Color(0xFF2B356F);

  static const LinearGradient mainBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0B1026), Color(0xFF241B5B), Color(0xFF1B2B7A)],
  );

  static const LinearGradient homepageBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF070B1F), Color(0xFF1A145C), Color(0xFF090D2E)],
  );

  static const LinearGradient successTick=LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,

    colors: [
      Color(0xFF6DFF6D),
      Color(0xFF12B84B),
    ],
  );

  static const LinearGradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF22C55E), Color(0xFF15803D)],
  );

  static const LinearGradient errorTic = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,

    colors: [
      Color(0xFFFF6B75),
      Color(0xFFFF3D4F),
      Color(0xFFE11D35),
    ],
  );

  static const LinearGradient errorGradient = LinearGradient(
    colors: [Color(0xFFEF4444), Color(0xFFB91C1C)],
  );

  static const LinearGradient goldGradient = LinearGradient(
    colors: [Color(0xFFFFC107), Color(0xFFFF9800)],
  );
}
