import 'package:flutter/material.dart';
import 'package:custom_ui/custom_ui.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('按钮')),
      body: ListView(children: [
        CButton('默认'),
      ]),
    );
  }
}
