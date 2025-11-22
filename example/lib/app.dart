import 'package:custom_ui/custom_ui.dart';
import 'package:custom_ui_example/home/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  final primaryColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    return CThemeProvider(
      theme: CTheme(),
      // CThemeProvider需要包裹MaterialApp才能防止路由跳转后丢失上文的CTheme
      child: MaterialApp(
        home: const HomePage(),
        theme: ThemeData(
          primaryColor: primaryColor,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryColor),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: primaryColor,
          colorScheme: ColorScheme.fromSwatch(
            brightness: Brightness.dark,
            primarySwatch: primaryColor,
          ),
        ),
      ),
    );
  }
}
