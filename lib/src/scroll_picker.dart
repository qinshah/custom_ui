import 'package:flutter/material.dart';

class CPickerItem<T> {
  final T value;
  final List<CPickerItem<T>> children;

  CPickerItem({
    required this.value,
    this.children = const [],
  });
}

class CScrollPicker<T> extends StatefulWidget {
  const CScrollPicker({
    super.key,
    this.itemExtent = 40,
    this.columns = 1,
    required this.items,
    required this.onChanged,
  });

  final ValueChanged<List<T?>> onChanged;

  final double itemExtent;

  final List<CPickerItem<T>> items;

  final int columns;

  @override
  State<CScrollPicker<T>> createState() => _CScrollPickerState<T>();
}

class _CScrollPickerState<T> extends State<CScrollPicker<T>> {
  late final List<CPickerItem<T>?> _selectedItems =
      List.filled(widget.columns, null);
  late final List<FixedExtentScrollController> _controllers =
      List.generate(widget.columns, (_) => FixedExtentScrollController());

  @override
  void initState() {
    super.initState();
    _initSelectedItems();
  }

  void _initSelectedItems() {
    if (widget.items.isEmpty) return;
    _selectedItems[0] = widget.items.first;
    for (int i = 1; i < widget.columns; i++) {
      final children = _selectedItems[i - 1]?.children ?? [];
      _selectedItems[i] = children.isNotEmpty ? children.first : null;
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onColumnChanged(int columnIndex, int itemIndex, List<CPickerItem<T>> items) {
    setState(() {
      _selectedItems[columnIndex] = items[itemIndex];
      // 更新后续列的选中项，尽量保持当前位置
      for (int i = columnIndex + 1; i < widget.columns; i++) {
        final children = _selectedItems[i - 1]?.children ?? [];
        if (children.isEmpty) {
          _selectedItems[i] = null;
          continue;
        }
        // 获取当前滚动位置，限制在新列表的有效范围内
        final currentIndex = _controllers[i].hasClients 
            ? _controllers[i].selectedItem 
            : 0;
        final clampedIndex = currentIndex.clamp(0, children.length - 1);
        _selectedItems[i] = children[clampedIndex];
      }
    });
    widget.onChanged(_selectedItems.map((item) => item?.value).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildColumn(widget.items, 0),
        for (int i = 1; i < widget.columns; i++) ...[
          SizedBox(width: 10),
          _buildColumn(_selectedItems[i - 1]?.children ?? [], i)
        ],
      ],
    );
  }

  Widget _buildColumn(List<CPickerItem<T>> items, int columnIndex) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          ListWheelScrollView.useDelegate(
            controller: _controllers[columnIndex],
            itemExtent: widget.itemExtent,
            onSelectedItemChanged: (index) {
              _onColumnChanged(columnIndex, index, items);
            },
            physics: const FixedExtentScrollPhysics(),
            overAndUnderCenterOpacity: 0.2,
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: items.length,
              builder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(items[index].value.toString()),
                );
              },
            ),
            useMagnifier: true,
          ),
          IgnorePointer(
            child: Container(
              height: widget.itemExtent,
              decoration: BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
