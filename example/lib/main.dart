import 'package:custom_ui/custom_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// TODO 换一种方式存储custom theme
final globalCTheme = CTheme(
  colors: const CColors(
    primary: Colors.blue,
    onPrimary: Colors.white,
    success: Colors.green,
    failure: Colors.red,
    background: Colors.white,
    foreground: Colors.black,
  ),
  textStyles: const CTextStyles(
    heading: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    body: TextStyle(fontSize: 16),
    caption: TextStyle(fontSize: 12),
  ),
  radii: CRadii(
    small: const Radius.circular(8.0),
    medium: const Radius.circular(12.0),
    large: const Radius.circular(24.0),
  ),
  buttonStyles: CButtonStyles(
    primary: CButtonStyle(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      radius: const Radius.circular(8.0),
    ),
    success: CButtonStyle(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      radius: const Radius.circular(8.0),
    ),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom UI Demo',
      theme: globalCTheme.toMaterial(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom UI Demo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'textStyles.heading',
                style: globalCTheme.textStyles.heading,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'textStyles.body',
                style: globalCTheme.textStyles.body,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'textStyles.caption',
                style: globalCTheme.textStyles.caption,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Primary Button'),
              ),
              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Card with medium radius',
                        style: globalCTheme.textStyles.heading,
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: globalCTheme.buttonStyles.success?.toMaterial(),
                        onPressed: () {},
                        child: const Text('Success'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}