import 'package:custom_ui/custom_ui.dart';
import 'package:custom_ui_example/common/context_extension.dart';
import 'package:custom_ui_example/home/category.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.name, required this.items});

  final String name;
  final List<Category> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        const SizedBox(height: 8),
        Wrap(
          spacing: 3,
          runSpacing: 3,
          children: items.map(
            (item) {
              return CButton(
                onTap: () => context.push(item.page),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item.iconData),
                      Text(
                        item.name,
                        style: TextStyle(fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
