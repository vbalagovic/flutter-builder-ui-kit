// theme/theme_provider.dart

import 'package:flutter/material.dart';

class ThemeProvider extends StatefulWidget {
  final Widget child;

  const ThemeProvider({
    super.key,
    required this.child,
  });

  @override
  State<ThemeProvider> createState() => ThemeProviderState();

  static ThemeProviderState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ThemeInheritedWidget>()!
        .data;
  }
}

class ThemeProviderState extends State<ThemeProvider> {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    setState(() {
      if (_themeMode == ThemeMode.system) {
        _themeMode = ThemeMode.light;
      } else if (_themeMode == ThemeMode.light) {
        _themeMode = ThemeMode.dark;
      } else {
        _themeMode = ThemeMode.system;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeInheritedWidget(
      data: this,
      child: widget.child,
    );
  }
}

class ThemeInheritedWidget extends InheritedWidget {
  final ThemeProviderState data;

  const ThemeInheritedWidget({
    super.key,
    required this.data,
    required super.child,
  });

  @override
  bool updateShouldNotify(ThemeInheritedWidget oldWidget) {
    return true;
  }
}
