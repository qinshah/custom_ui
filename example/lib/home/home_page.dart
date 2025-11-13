import 'package:example/basic/button_page.dart';
import 'package:example/common/data_model/page_model.dart';
import 'package:example/home/category_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          CategoryWidget(
            name: '基础',
            pages: [
              PageModel('按钮', ButtonPage()),
            ],
          ),
        ],
      ),
    );
  }
}
