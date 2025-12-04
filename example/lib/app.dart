import 'package:custom_ui/custom_ui.dart';
import 'package:custom_ui_example/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
          scaffoldBackgroundColor: Color.fromARGB(255, 251, 247, 247),
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
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [const Locale('zh', 'CN'), const Locale('en', 'US')],
      ),
    );
  }
}
