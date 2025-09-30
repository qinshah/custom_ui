import 'package:custom_ui/custom_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Global theme definition remains the same
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
      title: 'CTheme Demo',
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
        title: const Text('CTheme Properties'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('Colors (CColors)'),
          _buildColorRow('primary', globalCTheme.colors.primary),
          _buildColorRow('onPrimary', globalCTheme.colors.onPrimary),
          _buildColorRow('success', globalCTheme.colors.success),
          _buildColorRow('failure', globalCTheme.colors.failure),
          _buildColorRow('background', globalCTheme.colors.background),
          _buildColorRow('foreground', globalCTheme.colors.foreground),
          const Divider(height: 32),
          _buildSectionTitle('Text Styles (CTextStyles)'),
          _buildTextStyleRow('heading', globalCTheme.textStyles.heading),
          _buildTextStyleRow('body', globalCTheme.textStyles.body),
          _buildTextStyleRow('caption', globalCTheme.textStyles.caption),
          const Divider(height: 32),
          _buildSectionTitle('Radii (CRadii)'),
          _buildRadiusRow('small', globalCTheme.radii.small),
          _buildRadiusRow('medium', globalCTheme.radii.medium),
          _buildRadiusRow('large', globalCTheme.radii.large),
          const Divider(height: 32),
          _buildSectionTitle('Button Styles (CButtonStyles)'),
          _buildButtonStyleRow('primary', globalCTheme.buttonStyles.primary),
          if (globalCTheme.buttonStyles.success != null)
            _buildButtonStyleRow('success', globalCTheme.buttonStyles.success!),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildColorRow(String name, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Text(
            '#${color.value.toRadixString(16).substring(2).toUpperCase()}',
            style: const TextStyle(fontFamily: 'monospace'),
          ),
        ],
      ),
    );
  }

  Widget _buildTextStyleRow(String name, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(fontSize: 16, color: Colors.grey)),
          Text('Sample Text', style: style),
        ],
      ),
    );
  }

  Widget _buildRadiusRow(String name, Radius radius) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
              borderRadius: BorderRadius.all(radius),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Text(
            '${radius.x.toStringAsFixed(1)}',
            style: const TextStyle(fontFamily: 'monospace'),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonStyleRow(String name, CButtonStyle style) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 4),
          ElevatedButton(
            style: style.toMaterial(),
            onPressed: () {},
            child: Text('Styled Button'),
          ),
        ],
      ),
    );
  }
}