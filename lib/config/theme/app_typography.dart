import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {

  static TextStyle _withPoppins(TextStyle style) {
    return GoogleFonts.poppins(textStyle: style);
  }
  // Headings
  static TextStyle get headingXLarge => _withPoppins(const TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    height: 1.3, // 52/40
    letterSpacing: -0.25,
  ));

  static TextStyle get headingLarge => _withPoppins(const TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w600,
    height: 1.294, // 44/34
    letterSpacing: -0.25,
  ));

  static TextStyle get headingMedium => _withPoppins(const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.286, // 36/28
    letterSpacing: -0.25,
  ));

  static TextStyle get headingSmall => _withPoppins(const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.333, // 32/24
    letterSpacing: -0.1,
  ));

  static TextStyle get headingXSmall => _withPoppins(const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4, // 28/20
    letterSpacing: -0.1,
  ));

  static TextStyle get headingXXSmall => _withPoppins(const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.429, // 20/14
    letterSpacing: 0.8,
  ));

  // Labels
  static TextStyle get labelLarge => _withPoppins(const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400, // Regular
    height: 1.333, // 24/18
    letterSpacing: 0,
  ));

  static TextStyle get labelLargeStrong => _withPoppins(const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600, // DemiBold
    height: 1.333,
    letterSpacing: 0,
  ));

  static TextStyle get labelMedium => _withPoppins(const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.25, // 20/16
    letterSpacing: 0.1,
  ));

  static TextStyle get labelMediumStrong => _withPoppins(const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.25,
    letterSpacing: 0.1,
  ));

  static TextStyle get labelSmall => _withPoppins(const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.429, // 20/14
    letterSpacing: 0.1,
  ));

    static TextStyle get labelSmallRegular => _withPoppins(const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.429, // 20/14
    letterSpacing: 0.1,
  ));

  static TextStyle get labelSmallStrong => _withPoppins(const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.429,
    letterSpacing: 0.1,
  ));

  static TextStyle get labelXSmall => _withPoppins(const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.333, // 16/12
    letterSpacing: 0.25,
  ));

  static TextStyle get labelXSmallStrong => _withPoppins(const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.333,
    letterSpacing: 0.25,
  ));

  // Paragraphs
  static TextStyle get paragraphLarge => _withPoppins(const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400, // Regular
    height: 1.556, // 28/18
    letterSpacing: 0,
  ));

  static TextStyle get paragraphMedium => _withPoppins(const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5, // 24/16
    letterSpacing: 0.1,
  ));

  static TextStyle get paragraphSmall => _withPoppins(const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.571, // 22/14
    letterSpacing: 0.25,
  ));

  static TextStyle get paragraphXSmall => _withPoppins(const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.833, // 22/12
    letterSpacing: 0.25,
  ));

  // Display styles
  static TextStyle get displayLarge => _withPoppins(const TextStyle(
    fontSize: 88,
    fontWeight: FontWeight.w400, // Regular
    height: 1.1, // 96.8/88
    letterSpacing: -1.5,
  ));

  static TextStyle get displayMedium => _withPoppins(const TextStyle(
    fontSize: 72,
    fontWeight: FontWeight.w400,
    height: 1.1, // 79.2/72
    letterSpacing: -0.5,
  ));

  static TextStyle get displaySmall => _withPoppins(const TextStyle(
    fontSize: 56,
    fontWeight: FontWeight.w400,
    height: 1.1, // 61.6/56
    letterSpacing: -0.25,
  ));
  }