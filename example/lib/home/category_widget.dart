import 'package:example/common/context_extension.dart';
import 'package:example/common/data_model/page_model.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.name, required this.pages});

  final String name;
  final List<PageModel> pages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: ExpansionTile(
        shape: OutlineInputBorder(),
        initiallyExpanded: true,
        title: Text(name),
        childrenPadding: EdgeInsets.all(8),
        children: pages
            .map((page) => _buildItem(page.name, page.view, context))
            .toList(),
      ),
    );
  }

  Widget _buildItem(String title, Widget page, BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final borderRadius = BorderRadius.circular(8);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          borderRadius: borderRadius,
        ),
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () => context.push(page),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child:
                Center(child: Text(title, style: TextStyle(color: primaryColor))),
          ),
        ),
      ),
    );
  }
}
