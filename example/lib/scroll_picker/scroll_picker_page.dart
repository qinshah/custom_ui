import 'package:custom_ui/custom_ui.dart';
import 'package:flutter/material.dart';

class ScrollPickerPage extends StatelessWidget {
  const ScrollPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('滚动选择器')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          SizedBox(
            height: 200,
            child: Align(
              alignment: Alignment.topCenter,
              child: CScrollPicker(
                columns: 2,
                items: [
                  // 1月
                  CPickerItem(
                    value: '1月',
                    children: List.generate(
                      31,
                      (index) => CPickerItem(value: '${index + 1}号'),
                    ),
                  ),
                  // 2月
                  CPickerItem(
                    value: '2月',
                    children: List.generate(
                      28,
                      (index) => CPickerItem(value: '${index + 1}号'),
                    ),
                  ),
                  // 3月
                  CPickerItem(
                    value: '3月',
                    children: List.generate(
                      31,
                      (index) => CPickerItem(value: '${index + 1}号'),
                    ),
                  ),
                  // 4月
                  CPickerItem(value: '4月'),
                ],
                onChanged: (List<String?> value) {
                  print('选中了：$value');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
