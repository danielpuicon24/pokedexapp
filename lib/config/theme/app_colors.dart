import 'package:flutter/material.dart';

class AppColors {
  // Color principal de la app
  static const Color primary = Color(0xFFFFFAE6);
  static const Color baseGrey = Color(0xFFf3f3f3);
  static const Color white = Color(0xFFFFFFFF);
  static const _colorSeed = Color.fromARGB(255, 0, 72, 156);
  static const _colorBlack = Color(0xff000000);
  static const _colorRed = Color(0xffff0000);
  static const _colorSubtle1 = Color(0xff61646B);
  static const _colorSubtle2 = Color(0xffAFB1B6);
  static const _colorBackground = Color(0xffEFEFF0);
  // static const _colorSurface = Color(0xffFAFAFA);
  static const _colorPrimarySubtle = Color(0xffE3E3E3);
  static const _colorWhite = Colors.white;

  Color get colorSeed => _colorSeed;
  Color get colorBlack => _colorBlack;
  Color get colorRed => _colorRed;
  Color get colorSubtle1 => _colorSubtle1;
  Color get colorSubtle2 => _colorSubtle2;
  Color get colorBackground => _colorBackground;
  Color get colorPrimarySubtle => _colorPrimarySubtle;
  Color get colorWhite => _colorWhite;
  
  // Variaciones del color principal
  static const Color primary50 = Color(0xFFFFFAE6);
  static const Color primary100 = Color(0xFFFFEEB0);
  static const Color primary200 = Color(0xFFFFE68A);
  static const Color primary300 = Color(0xFFFFDA54);
  static const Color primary400 = Color(0xFFFFD333);
  static const Color primary500 = Color(0xFFFFC800);
  static const Color primary600 = Color(0xFFE8B600);
  static const Color primary700 = Color(0xFFB58E00);
  static const Color primary800 = Color(0xFF8C6E00);
  static const Color primary900 = Color(0xFF6B5400);

  // Colores secundarios
  static const Color secondary50 = Color(0xFFE6EAEE);
  static const Color secondary100 = Color(0xFFB0BECB);
  static const Color secondary200 = Color(0xFF8A9EB2);
  static const Color secondary300 = Color(0xFF54728F);
  static const Color secondary400 = Color(0xFF335679);
  static const Color secondary500 = Color(0xFF002C58);
  static const Color secondary600 = Color(0xFF002850);
  static const Color secondary700 = Color(0xFF001F3E);
  static const Color secondary800 = Color(0xFF001830);
  static const Color secondary900 = Color(0xFF001225);
  
  //Colores terciarios
  static const Color tertiary50 = Color(0xFFEDFCEA);
  static const Color tertiary100 = Color(0xFFC8F7BF);
  static const Color tertiary200 = Color(0xFFAEF3A0);
  static const Color tertiary300 = Color(0xFF89EE75);
  static const Color tertiary400 = Color(0xFF72EA5A);
  static const Color tertiary500 = Color(0xFF4FE531);
  static const Color tertiary600 = Color(0xFF48D02D);
  static const Color tertiary700 = Color(0xFF38A323);
  static const Color tertiary800 = Color(0xFF2B7E1B);
  static const Color tertiary900 = Color(0xFF216015);
  static const Color purple = Color(0xFFede9ff);

  //Grises
  static const Color neutral500 = Color(0xFFD0D5DD);
  static const Color neutral600 = Color(0xFF838799);
  static const Color neutral700 = Color(0xFF5D606D);
  static const Color secondaryGrey100 = Color(0xFFB0BECB);
  static const Color contentSecondary = Color(0xFF898F8F);
  static const Color contentDisabled = Color(0xFFE0E0E7);

  // Colores para textos
  static const Color textPrimaryColor = Color(0xFF212121);
  static const Color textSecondaryColor = Color(0xFF757575);
}