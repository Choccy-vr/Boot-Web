import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TerminalColors {
  // Core terminal colors
  static const Color black = Color(0xFF0A0A0A);
  static const Color darkGray = Color(0xFF1A1A1A);
  static const Color gray = Color(0xFF333333);
  static const Color lightGray = Color(0xFF666666);
  static const Color white = Color(0xFFFFFFFF);

  // Terminal accent colors
  static const Color green = Color(0xFF00FF00);
  static const Color cyan = Color(0xFF00FFFF);
  static const Color yellow = Color(0xFFFFFF00);
  static const Color red = Color(0xFFFF5555);
  static const Color magenta = Color(0xFFFF00FF);
  static const Color blue = Color(0xFF5555FF);
}

ColorScheme buildTerminalColorScheme() {
  return ColorScheme.dark(
    // Primary actions (buttons, selections)
    primary: TerminalColors.green,
    onPrimary: TerminalColors.black,
    primaryContainer: Color(0xFF003300),
    onPrimaryContainer: TerminalColors.green,
    primaryFixed: TerminalColors.green,
    onPrimaryFixed: TerminalColors.black,
    primaryFixedDim: Color(0xFF00CC00),
    onPrimaryFixedVariant: TerminalColors.black,

    // Secondary actions
    secondary: TerminalColors.cyan,
    onSecondary: TerminalColors.black,
    secondaryContainer: Color(0xFF003333),
    onSecondaryContainer: TerminalColors.cyan,
    secondaryFixed: TerminalColors.cyan,
    onSecondaryFixed: TerminalColors.black,
    secondaryFixedDim: Color(0xFF00CCCC),
    onSecondaryFixedVariant: TerminalColors.black,

    // Surface hierarchy
    surface: TerminalColors.darkGray,
    onSurface: TerminalColors.white,
    surfaceDim: TerminalColors.black,
    surfaceBright: Color(0xFF2A2A2A),
    surfaceContainerLowest: Color(0xFF0F0F0F),
    surfaceContainerLow: Color(0xFF1A1A1A),
    surfaceContainer: Color(0xFF1F1F1F),
    surfaceContainerHigh: Color(0xFF2A2A2A),
    surfaceContainerHighest: Color(0xFF333333),

    // Status colors
    error: TerminalColors.red,
    onError: TerminalColors.black,
    errorContainer: Color(0xFF330000),
    onErrorContainer: TerminalColors.red,

    // Utility colors
    outline: TerminalColors.gray,
    outlineVariant: Color(0xFF222222),
    shadow: Color(0x80000000),
    scrim: Color(0xCC000000),
    inverseSurface: TerminalColors.white,
    onInverseSurface: TerminalColors.black,
    inversePrimary: Color(0xFF004400),

    // Custom semantic colors via tertiary
    tertiary: TerminalColors.yellow,
    onTertiary: TerminalColors.black,
    tertiaryContainer: Color(0xFF333300),
    onTertiaryContainer: TerminalColors.yellow,
    tertiaryFixed: TerminalColors.yellow,
    onTertiaryFixed: TerminalColors.black,
    tertiaryFixedDim: Color(0xFFCCCC00),
    onTertiaryFixedVariant: TerminalColors.black,
  );
}

ThemeData buildTerminalTheme() {
  return ThemeData(
    colorScheme: buildTerminalColorScheme(),
    textTheme: GoogleFonts.jetBrainsMonoTextTheme(ThemeData.dark().textTheme),

    // Card Theme
    cardTheme: CardThemeData(
      color: TerminalColors.darkGray,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(color: TerminalColors.gray),
      ),
    ),

    // Button Themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: TerminalColors.green,
        foregroundColor: TerminalColors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        textStyle: TextStyle(
          fontFamily: 'JetBrains Mono',
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style:
          OutlinedButton.styleFrom(
            foregroundColor: TerminalColors.green,
            side: BorderSide(color: TerminalColors.green, width: 1.5),
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            textStyle: TextStyle(
              fontFamily: 'JetBrains Mono',
              fontWeight: FontWeight.w500,
            ),
          ).copyWith(
            overlayColor: WidgetStateProperty.all(
              TerminalColors.green.withOpacity(0.1),
            ),
          ),
    ),

    textButtonTheme: TextButtonThemeData(
      style:
          TextButton.styleFrom(
            foregroundColor: TerminalColors.cyan,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            textStyle: TextStyle(
              fontFamily: 'JetBrains Mono',
              fontWeight: FontWeight.w500,
            ),
          ).copyWith(
            overlayColor: WidgetStateProperty.all(
              TerminalColors.cyan.withOpacity(0.1),
            ),
          ),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: TerminalColors.gray,
        foregroundColor: TerminalColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    ),

    // FloatingActionButton Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: TerminalColors.green,
      foregroundColor: TerminalColors.black,
      elevation: 4,
      focusElevation: 6,
      hoverElevation: 6,
      highlightElevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    // Icon Button Theme
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: TerminalColors.white,
        highlightColor: TerminalColors.green.withOpacity(0.2),
        hoverColor: TerminalColors.green.withOpacity(0.1),
      ),
    ),

    // App Bar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: TerminalColors.black,
      foregroundColor: TerminalColors.green,
      elevation: 2,
      shadowColor: Colors.black,
      titleTextStyle: GoogleFonts.jetBrainsMono(
        color: TerminalColors.green,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: TerminalColors.green),
    ),

    // Input/Form Themes
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: TerminalColors.darkGray,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: TerminalColors.gray),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: TerminalColors.gray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: TerminalColors.green, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: TerminalColors.red),
      ),
      labelStyle: TextStyle(color: TerminalColors.lightGray),
      hintStyle: TextStyle(color: TerminalColors.gray),
      prefixIconColor: TerminalColors.lightGray,
      suffixIconColor: TerminalColors.lightGray,
    ),

    // Checkbox Theme
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return TerminalColors.green;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(TerminalColors.black),
      side: BorderSide(color: TerminalColors.gray, width: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
    ),

    // Radio Theme
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return TerminalColors.green;
        }
        return TerminalColors.gray;
      }),
    ),

    // Switch Theme
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return TerminalColors.black;
        }
        return TerminalColors.gray;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return TerminalColors.green;
        }
        return TerminalColors.darkGray;
      }),
      trackOutlineColor: WidgetStateProperty.all(TerminalColors.gray),
    ),

    // Slider Theme
    sliderTheme: SliderThemeData(
      activeTrackColor: TerminalColors.green,
      inactiveTrackColor: TerminalColors.gray,
      thumbColor: TerminalColors.green,
      overlayColor: TerminalColors.green.withOpacity(0.2),
      valueIndicatorColor: TerminalColors.green,
      valueIndicatorTextStyle: TextStyle(
        color: TerminalColors.black,
        fontFamily: 'JetBrains Mono',
      ),
    ),

    // Progress Indicator Themes
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: TerminalColors.green,
      linearTrackColor: TerminalColors.gray,
      circularTrackColor: TerminalColors.gray,
    ),

    // Divider Theme
    dividerTheme: DividerThemeData(color: TerminalColors.gray, thickness: 1),

    // Dialog Theme
    dialogTheme: DialogThemeData(
      backgroundColor: TerminalColors.darkGray,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: TerminalColors.gray),
      ),
      titleTextStyle: GoogleFonts.jetBrainsMono(
        color: TerminalColors.green,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      contentTextStyle: GoogleFonts.jetBrainsMono(
        color: TerminalColors.white,
        fontSize: 14,
      ),
    ),

    // Snackbar Theme
    snackBarTheme: SnackBarThemeData(
      backgroundColor: TerminalColors.gray,
      contentTextStyle: GoogleFonts.jetBrainsMono(color: TerminalColors.white),
      actionTextColor: TerminalColors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),

    // Tooltip Theme
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: TerminalColors.black,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: TerminalColors.green),
      ),
      textStyle: GoogleFonts.jetBrainsMono(
        color: TerminalColors.green,
        fontSize: 12,
      ),
    ),

    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: TerminalColors.black,
      selectedItemColor: TerminalColors.green,
      unselectedItemColor: TerminalColors.gray,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    // Tab Bar Theme
    tabBarTheme: TabBarThemeData(
      labelColor: TerminalColors.green,
      unselectedLabelColor: TerminalColors.gray,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: TerminalColors.green, width: 2),
      ),
      labelStyle: GoogleFonts.jetBrainsMono(fontWeight: FontWeight.w600),
      unselectedLabelStyle: GoogleFonts.jetBrainsMono(
        fontWeight: FontWeight.w400,
      ),
    ),

    // List Tile Theme
    listTileTheme: ListTileThemeData(
      tileColor: Colors.transparent,
      selectedTileColor: TerminalColors.green.withOpacity(0.1),
      iconColor: TerminalColors.lightGray,
      textColor: TerminalColors.white,
      selectedColor: TerminalColors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
  );
}
