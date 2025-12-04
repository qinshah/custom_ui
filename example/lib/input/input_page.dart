import 'package:custom_ui/custom_ui.dart';
import 'package:flutter/material.dart';

class InputPage extends StatelessWidget {
  const InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('输入框')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Text('默认'),
          CInput(),
          const SizedBox(height: 16),
          Text('数字'),
          CInput(type: CInputType.number),
          const SizedBox(height: 16),
          Text('密码'),
          CInput(type: CInputType.password),
          const SizedBox(height: 16),
          Text('提示语'),
          CInput(hintText: '请输入'),
          const SizedBox(height: 16),
          Text('初始内容'),
          CInput(
            cntlr: TextEditingController(text: '初始内容'),
          ),
          const SizedBox(height: 16),
          Text('前缀'),
          CInput(
            prefix: Icon(Icons.lock),
          ),
          const SizedBox(height: 16),
          Text('后缀'),
          CInput(
            suffix: Icon(Icons.abc),
          ),
          const SizedBox(height: 16),
          Text('显示清空按钮'),
          CInput(
            showClearIcon: true,
            cntlr: TextEditingController(text: '点击右侧按钮清空'),
          ),
        ],
      ),
    );
  }
}
