import 'package:custom_ui_example/button/button_page.dart';
import 'package:custom_ui_example/home/category.dart';
import 'package:custom_ui_example/home/view/category_widget.dart';
import 'package:custom_ui_example/input/input_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom UI'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          CategoryWidget(
            name: '基础',
            items: [
              Category('按钮', Icons.mouse, ButtonPage()),
            ],
          ),
          const SizedBox(height: 16),
          CategoryWidget(
            name: '表单',
            items: [
              Category('输入框', Icons.input, InputPage()),
            ],
          ),
        ],
      ),
    );
  }
}
