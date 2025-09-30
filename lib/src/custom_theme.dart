import 'package:flutter/material.dart';

/// A set of custom colors designed based on scenarios and purposes.
class CustomColors {
  final Color primary;
  final Color onPrimary;
  final Color success;
  final Color failure;
  final Color background;
  final Color foreground;

  const CustomColors({
    required this.primary,
    required this.onPrimary,
    required this.success,
    required this.failure,
    required this.background,
    required this.foreground,
  });
}

/// A set of custom text styles for different content types.
class CustomTextStyles {
  final TextStyle heading;
  final TextStyle body;
  final TextStyle caption;

  const CustomTextStyles({
    required this.heading,
    required this.body,
    required this.caption,
  });
}

/// A set of custom border radii for UI elements.
class CustomRadii {
  final Radius small;
  final Radius medium;
  final Radius large;

  const CustomRadii({
    required this.small,
    required this.medium,
    required this.large,
  });
}

/// Defines a custom UI theme with specific design attributes.
///
/// This theme is structured based on a custom design philosophy, focusing on
/// properties like colors, text styles, and border radii. It provides methods
/// to convert to and from Material Design's `ThemeData`.
class CustomTheme {
  final CustomColors colors;
  final CustomTextStyles textStyles;
  final CustomRadii radii;

  const CustomTheme({
    required this.colors,
    required this.textStyles,
    required this.radii,
  });

  /// Creates a `CustomTheme` instance from a Material `ThemeData`.
  ///
  /// This allows for interoperability, adapting a standard Material theme
  /// to the custom theme structure.
  factory CustomTheme.fromMaterialTheme(ThemeData materialTheme) {
    return CustomTheme(
      colors: CustomColors(
        primary: materialTheme.colorScheme.primary,
        onPrimary: materialTheme.colorScheme.onPrimary,
        success: Colors.green, // ThemeData doesn't have a direct 'success' color.
        failure: materialTheme.colorScheme.error,
        background: materialTheme.colorScheme.background,
        foreground: materialTheme.colorScheme.onBackground,
      ),
      textStyles: CustomTextStyles(
        heading: materialTheme.textTheme.headlineMedium!,
        body: materialTheme.textTheme.bodyMedium!,
        caption: materialTheme.textTheme.bodySmall!,
      ),
      // Radii don't have a direct mapping, so we use default values.
      radii: CustomRadii(
        small: const Radius.circular(4.0),
        medium: const Radius.circular(8.0),
        large: const Radius.circular(16.0),
      ),
    );
  }

  /// Converts this `CustomTheme` to a Material `ThemeData` object.
  ///
  /// This enables the custom theme to be applied to a `MaterialApp`.
  ThemeData toMaterialTheme() {
    final colorScheme = ColorScheme(
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      secondary: colors.success, // Map success color to secondary
      onSecondary: Colors.white, // Assuming white text on success color
      surface: colors.background,
      background: colors.background,
      error: colors.failure,
      onSurface: colors.foreground,
      onBackground: colors.foreground,
      onError: Colors.white, // Common practice for text on error colors
      brightness: ThemeData.estimateBrightnessForColor(colors.background),
    );

    return ThemeData(
      colorScheme: colorScheme,
      textTheme: TextTheme(
        headlineMedium: textStyles.heading.copyWith(color: colors.foreground),
        bodyMedium: textStyles.body.copyWith(color: colors.foreground.withOpacity(0.87)),
        bodySmall: textStyles.caption.copyWith(color: colors.foreground.withOpacity(0.6)),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        titleTextStyle: textStyles.heading.copyWith(color: colors.onPrimary),
      ),
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(radii.medium),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(radii.small),
          ),
        ),
      ),
    );
  }
}