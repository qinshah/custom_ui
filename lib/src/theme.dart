import 'package:custom_ui/src/color.dart';
import 'package:flutter/widgets.dart';

class CThemeProvider extends StatelessWidget {
  const CThemeProvider({super.key, required this.theme, required this.child});

  final CTheme theme;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _InheritedCTheme(themeProvider: this, child: child);
  }
}

class _InheritedCTheme extends InheritedTheme {
  const _InheritedCTheme({required this.themeProvider, required super.child});

  final CThemeProvider themeProvider;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return CThemeProvider(theme: themeProvider.theme, child: child);
  }

  @override
  bool updateShouldNotify(_InheritedCTheme old) =>
      themeProvider.theme != old.themeProvider.theme;
}

enum CColorType {
  normal,
  success,
  warning,
  error,
  info,
}

class CTheme {
  Color colorByType(CColorType type) {
    switch (type) {
      case CColorType.normal:
        return colorScheme.normal;
      case CColorType.success:
        return colorScheme.success;
      case CColorType.warning:
        return colorScheme.warning;
      case CColorType.error:
        return colorScheme.error;
      case CColorType.info:
        return colorScheme.info;
    }
  }

  final CColorScheme colorScheme;
  const CTheme({
    this.colorScheme = const CColorScheme(),
  });

  static CTheme of(BuildContext context) {
    final inheritedCTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedCTheme>();
    return inheritedCTheme!.themeProvider.theme;
  }
}

class CColorScheme {
  final Color normal;
  final Color success;
  final Color warning;
  final Color error;
  final Color info;

  const CColorScheme({
    this.normal = CColor.teal,
    this.success = CColor.greenC,
    this.warning = CColor.orange,
    this.error = CColor.redC,
    this.info = CColor.grey,
  });
}

// class CValueScheme {
//   final double normal;
//   final double small;
//   final double large;
//   const CValueScheme({
//     this.normal = 16.0,
//     this.small = 12.0,
//     this.large = 20.0,
//   });
// }
