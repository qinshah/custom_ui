import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Future<T?> push<T extends Object?>(Widget page) {
    return Navigator.of(
      this,
    ).push<T>(MaterialPageRoute(builder: (context) => page));
  }
}
