import 'package:flutter/material.dart';

class AppTheme {
  ///************************ CONSTANTES **************************************/
  ///
  static const _colorSeed = Color.fromARGB(255, 0, 72, 156);
  static const _colorBlack = Color(0xff000000);
  static const _colorSubtle1 = Color(0xff61646B);
  static const _colorSubtle2 = Color(0xffAFB1B6);
  static const _colorBackground = Color(0xffEFEFF0);
  // static const _colorSurface = Color(0xffFAFAFA);
  static const _colorPrimarySubtle = Color(0xffE3E3E3);
  static const _colorWhite = Colors.white;

  Color get colorSeed => _colorSeed;
  Color get colorBlack => _colorBlack;
  Color get colorSubtle1 => _colorSubtle1;
  Color get colorSubtle2 => _colorSubtle2;
  Color get colorBackground => _colorBackground;
  Color get colorPrimarySubtle => _colorPrimarySubtle;
  Color get colorWhite => _colorWhite;

  static const double _textDisplayLargeSize = 64;
  static const double _textDisplayMediumSize = 48;
  static const double _textDisplaySmallSize = 40;
  static const double _textHeadlineLargeSize = 32;
  static const double _textHeadlineMediumSize = 28;
  static const double _textHeadlineSmallSize = 24;
  static const double _textTitleLargeSize = 22;
  static const double _textTitleMediumSize = 16;
  static const double _textTitleSmallSize = 14;
  static const double _textLabelLargeSize = 16;
  static const double _textLabelMediumSize = 14;
  static const double _textLabelSmallSize = 12;
  static const double _textBodyLargeSize = 16;
  static const double _textBodyMediumSize = 14;
  static const double _textBodySmallSize = 12;
  static const String _fontFamily = "SF-Pro";

  ///************************** TEXTO *****************************************/
  ///
  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: _textDisplayLargeSize,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      fontSize: _textDisplayMediumSize,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      fontSize: _textDisplaySmallSize,
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: TextStyle(
      fontSize: _textHeadlineLargeSize,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontSize: _textHeadlineMediumSize,
      fontWeight: FontWeight.w500,
      color: Colors.white
    ),
    headlineSmall: TextStyle(
      fontSize: _textHeadlineSmallSize,
      fontWeight: FontWeight.w400,
        color: Colors.white
    ),
    titleLarge: TextStyle(
      fontSize: _textTitleLargeSize,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontSize: _textTitleMediumSize,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      fontSize: _textTitleSmallSize,
      fontWeight: FontWeight.w600,
    ),
    labelLarge: TextStyle(
      fontSize: _textLabelLargeSize,
      fontWeight: FontWeight.w700,
        color: Colors.white
    ),
    labelMedium: TextStyle(
      fontSize: _textLabelMediumSize,
      fontWeight: FontWeight.w300,
      color: Colors.white
    ),
    labelSmall: TextStyle(
      fontSize: _textLabelSmallSize,
      fontWeight: FontWeight.w400,
        color: Colors.white
    ),
    bodyLarge: TextStyle(
      fontSize: _textBodyLargeSize,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: _textBodyMediumSize,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontSize: _textBodySmallSize,
      fontWeight: FontWeight.w400,
    ),
  );

  ///**************************** INPUTS **************************************/
  ///

  final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: _colorSubtle2),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: _colorSubtle2),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 12.0,
      vertical: 13,
    ),
    hintStyle: _textTheme.labelMedium!.copyWith(
      color: _colorSubtle1,
    ),
    // labelStyle: _textTheme.labelMedium!.copyWith(
    //   color: _colorSubtle1,
    //   fontWeight: FontWeight.w300,
    //   fontStyle: FontStyle.italic,
    // ),
    fillColor: Colors.transparent,
    filled: true,
    isDense: true,
    prefixIconColor: _colorSubtle2,
    focusColor: Colors.transparent,
  );

  ///***************************** BOTONES ************************************/
  ///

  final filledButtonTheme = FilledButtonThemeData(
    style: ButtonStyle(
      foregroundColor: const MaterialStatePropertyAll(Colors.white),
      backgroundColor: const MaterialStatePropertyAll(_colorSeed),
      textStyle: MaterialStatePropertyAll(_textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w500,
        fontFamily: _fontFamily,
      )),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
      }),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      ),
      alignment: Alignment.center,
    ),
  );

  final iconButtonTheme = IconButtonThemeData(
    style: ButtonStyle(
      foregroundColor: const MaterialStatePropertyAll(Colors.white),
      backgroundColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) {
          return states.contains(MaterialState.disabled)
              ? _colorPrimarySubtle
              : _colorSeed;
        },
      ),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(228));
      }),
      padding: MaterialStateProperty.all(
        const EdgeInsets.all(16),
      ),
      alignment: Alignment.center,
      iconColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) {
          return states.contains(MaterialState.disabled)
              ? _colorSeed
              : Colors.white;
        },
      ),
    ),
  );

  final OutlinedButtonThemeData outlinedButtonThemeData =
      OutlinedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(_textTheme.labelMedium!.copyWith(
        fontWeight: FontWeight.w500,
        fontFamily: _fontFamily,
      )),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
      }),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      ),
      alignment: Alignment.center,
      iconSize: MaterialStateProperty.all(20),
    ),
  );

  final ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: const MaterialStatePropertyAll(Colors.white),
      backgroundColor: const MaterialStatePropertyAll(_colorSeed),
      textStyle: MaterialStatePropertyAll(_textTheme.labelMedium!.copyWith(
        fontWeight: FontWeight.w500,
        fontFamily: _fontFamily,
      )),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
      }),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      alignment: Alignment.center,
      iconSize: MaterialStateProperty.all(20),
    ),
  );

  ///****************************** APPBAR ************************************/
  ///
  final appbarTheme = const AppBarTheme(
    color: Color.fromARGB(255, 0, 72, 156),
    titleTextStyle: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  );

  ///********************************* DATATABLE ******************************/
  ///
  // final DataTableThemeData dataTableTheme = DataTableThemeData(
  //   headingTextStyle: _textTheme._textLabelLarge!.copyWith(
  //     fontWeight: FontWeight.bold,
  //   ),
  //   dataTextStyle: _textTheme._textLabelMedium!,
  //   columnSpacing: 0,
  // );

  ///****************************** SELECCIONABLES ****************************/
  ///

  final radioTheme = RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith(
      (Set<MaterialState> states) {
        return states.contains(MaterialState.disabled)
            ? _colorBlack
            : _colorPrimarySubtle;
      },
    ),
  );

  final switchTheme = SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith(
      (Set<MaterialState> states) {
        return states.contains(MaterialState.selected)
            ? _colorBlack
            : states.contains(MaterialState.disabled)
                ? _colorPrimarySubtle
                : null;
      },
    ),
    overlayColor: const MaterialStatePropertyAll(_colorWhite),
  );

  final sliderTheme = const SliderThemeData(
    activeTrackColor: _colorBlack,
    inactiveTrackColor: _colorPrimarySubtle,
    thumbColor: _colorWhite,
    trackHeight: 12,
    disabledInactiveTrackColor: _colorBlack,
  );

  ///********************************* TABBAR ******************************/
  ///

  final tabBarTheme = TabBarTheme(
    labelColor: _colorBlack,
    unselectedLabelColor: _colorSubtle1,
    labelStyle: _textTheme.bodyMedium,
    unselectedLabelStyle: _textTheme.bodyMedium,
    indicatorColor: _colorBlack,
    indicatorSize: TabBarIndicatorSize.tab,
  );

  ///*********************** CONFIGURACIÓN GENERAL ****************************/
  ///

  ThemeData getLight() => ThemeData(
        fontFamily: _fontFamily,
        useMaterial3: true,
        colorSchemeSeed: _colorSeed,
        textTheme: _textTheme,
        scaffoldBackgroundColor: _colorWhite,
        filledButtonTheme: filledButtonTheme,
        outlinedButtonTheme: outlinedButtonThemeData,
        iconButtonTheme: iconButtonTheme,
        radioTheme: radioTheme,
        switchTheme: switchTheme,
        sliderTheme: sliderTheme,
        tabBarTheme: tabBarTheme,

        // _textButtonTheme: _textButtonTheme,
        appBarTheme: appbarTheme,
        inputDecorationTheme: inputDecorationTheme,
        elevatedButtonTheme: elevatedButtonThemeData,
        // dataTableTheme: dataTableTheme,
        dropdownMenuTheme:
            DropdownMenuThemeData(textStyle: _textTheme.labelSmall),
      );
}
