import 'package:flutter/material.dart';

/// A set of custom colors designed based on scenarios and purposes.
class CColors {
  final Color primary;
  final Color onPrimary;
  final Color success;
  final Color failure;
  final Color background;
  final Color foreground;

  const CColors({
    required this.primary,
    required this.onPrimary,
    required this.success,
    required this.failure,
    required this.background,
    required this.foreground,
  });
}

/// A set of custom button styles for different button types.
class CButtonStyle {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Radius? radius;

  const CButtonStyle({
    this.backgroundColor,
    this.foregroundColor,
    this.radius,
  });

  /// Converts this `CustomButtonStyle` to a Material `ButtonStyle` object.
  ButtonStyle toMaterial() {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      shape: radius != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.all(radius!),
            )
          : null,
    );
  }

  /// Creates a `CustomButtonStyle` instance from a Material `ButtonStyle`.
  factory CButtonStyle.fromMaterial(ButtonStyle? materialStyle) {
    final backgroundColor = materialStyle?.backgroundColor?.resolve({});
    final foregroundColor = materialStyle?.foregroundColor?.resolve({});
    Radius? radius;
    final shape = materialStyle?.shape?.resolve({});
    if (shape is RoundedRectangleBorder) {
      final borderRadius = shape.borderRadius;
      if (borderRadius is BorderRadius) {
        radius = borderRadius.topLeft;
      }
    }

    return CButtonStyle(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      radius: radius,
    );
  }
}

class CButtonStyles {
  final CButtonStyle primary;
  final CButtonStyle? success;

  const CButtonStyles({
    required this.primary,
    this.success,
  });
}

/// A set of custom text styles for different content types.
class CTextStyles {
  final TextStyle heading;
  final TextStyle body;
  final TextStyle caption;

  const CTextStyles({
    required this.heading,
    required this.body,
    required this.caption,
  });
}

/// A set of custom border radii for UI elements.
class CRadii {
  final Radius small;
  final Radius medium;
  final Radius large;

  const CRadii({
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
class CTheme {
  final CColors colors;
  final CTextStyles textStyles;
  final CRadii radii;
  final CButtonStyles buttonStyles;

  const CTheme({
    required this.colors,
    required this.textStyles,
    required this.radii,
    required this.buttonStyles,
  });

  /// Creates a `CustomTheme` instance from a Material `ThemeData`.
  ///
  /// This allows for interoperability, adapting a standard Material theme
  /// to the custom theme structure.
  factory CTheme.fromMaterial(ThemeData materialTheme) {
    return CTheme(
      colors: CColors(
        primary: materialTheme.colorScheme.primary,
        onPrimary: materialTheme.colorScheme.onPrimary,
        success: materialTheme.colorScheme.secondary,
        failure: materialTheme.colorScheme.error,
        background: materialTheme.colorScheme.surface,
        foreground: materialTheme.colorScheme.onSurface,
      ),
      textStyles: CTextStyles(
        heading: materialTheme.textTheme.headlineMedium!,
        body: materialTheme.textTheme.bodyMedium!,
        caption: materialTheme.textTheme.bodySmall!,
      ),
      radii: CRadii(
        small: const Radius.circular(4.0), // Simplified from theme
        medium: const Radius.circular(8.0),
        large: const Radius.circular(16.0),
      ),
      buttonStyles: CButtonStyles(
        primary: CButtonStyle.fromMaterial(
          materialTheme.elevatedButtonTheme.style,
        ),
        success: CButtonStyle(
          backgroundColor: materialTheme.colorScheme.secondary,
          foregroundColor: materialTheme.colorScheme.onSecondary,
        ),
      ),
    );
  }

  /// Converts this `CustomTheme` to a Material `ThemeData` object.
  ///
  /// This enables the custom theme to be applied to a `MaterialApp`.
  ThemeData toMaterial() {
    return ThemeData(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      colorScheme: ColorScheme(
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        secondary: colors.success,
        onSecondary: Colors.white,
        surface: colors.background,
        error: colors.failure,
        onError: colors.failure,
        onSurface: colors.foreground,
        brightness: ThemeData.estimateBrightnessForColor(colors.background),
      ),
      textTheme: TextTheme(
        headlineMedium: textStyles.heading.copyWith(color: colors.foreground),
        bodyMedium:
            textStyles.body.copyWith(color: colors.foreground.withAlpha(220)),
        bodySmall: textStyles.caption
            .copyWith(color: colors.foreground.withAlpha(150)),
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
        style: buttonStyles.primary.toMaterial(),
      ),
    );
  }
}
