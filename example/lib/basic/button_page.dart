import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_ui/custom_ui.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('按钮')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Text('默认文本'),
          Center(child: CButton(child: Text('默认文本'))),
          SizedBox(height: 16),
          Text('指定类型'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: CColorType.values.map(
              (type) {
                return CButton(type: type, child: Text(type.name));
              },
            ).toList(),
          ),
          SizedBox(height: 16),
          Text('图标'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              CButton(
                type: CColorType.normal,
                child: Icon(Icons.flutter_dash),
              ),
              CButton(
                type: CColorType.success,
                child: Icon(Icons.check),
              ),
              CButton(
                type: CColorType.warning,
                child: Icon(Icons.warning),
              ),
              CButton(
                type: CColorType.error,
                child: Icon(Icons.error),
              ),
              CButton(
                type: CColorType.info,
                child: Icon(Icons.message),
              ),
            ],
          ),
          Divider(
            height: 50,
            color: Colors.grey,
          ),
          Text('所有属性'),
          SizedBox(height: 50),
          _CustomPanel(),
        ],
      ),
    );
  }
}

class _CustomPanel extends StatefulWidget {
  const _CustomPanel();

  @override
  State<_CustomPanel> createState() => _CustomPanelState();
}

class _CustomPanelState extends State<_CustomPanel> {
  bool _iconChild = false;
  final _textCntlr = TextEditingController(text: '文本');
  double _iconSize = 24;
  CColorType _type = CColorType.normal;
  Color? _color;
  double _vPadding = 8;
  double _hPadding = 16;
  double _radius = 8;
  double _borderWidth = 1;
  Color _borderColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CButton(
            padding: EdgeInsets.symmetric(
              vertical: _vPadding,
              horizontal: _hPadding,
            ),
            color: _color,
            type: _type,
            borderRadius: BorderRadius.circular(_radius),
            border: Border.all(width: _borderWidth, color: _borderColor),
            child: _iconChild
                ? FlutterLogo(
                    size: _iconSize,
                  )
                : Text(_textCntlr.text),
          ),
        ),
        SizedBox(height: 50),
        Row(
          children: [
            Text('子组件:'),
            Expanded(
              child: CupertinoSlidingSegmentedControl(
                children: {
                  false: Text('文本'),
                  true: Text('图标'),
                },
                onValueChanged: (value) {
                  if (value == null) return;
                  setState(() => _iconChild = value);
                },
                groupValue: _iconChild,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        if (_iconChild)
          Row(
            children: [
              Text('尺寸：'),
              Expanded(
                child: Slider(
                  min: 10,
                  max: 100,
                  value: _iconSize,
                  onChanged: (value) => setState(() => _iconSize = value),
                ),
              ),
            ],
          )
        else ...[
          Row(
            children: [
              Text('文本:'),
              Expanded(
                child: TextField(
                  controller: _textCntlr,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => setState(() {}),
                ),
              ),
            ],
          )
        ],
        SizedBox(height: 8),
        Row(
          children: [
            Text('类型:'),
            Expanded(
              child: CupertinoSlidingSegmentedControl(
                groupValue: _type,
                children: Map.fromIterables(
                  CColorType.values,
                  CColorType.values.map(
                    (type) => Text(type.name),
                  ),
                ),
                onValueChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    _type = value;
                    _color = null;
                  });
                },
              ),
            ),
          ],
        ),
        Row(children: [
          Text('圆角大小:'),
          Expanded(
            child: Slider(
              min: 0,
              max: 100,
              value: _radius,
              onChanged: (value) {
                setState(() => _radius = value);
              },
            ),
          )
        ]),
        Row(children: [
          Text('垂直内间距:'),
          Expanded(
            child: Slider(
              min: 0,
              max: 50,
              value: _vPadding,
              onChanged: (value) => setState(() => _vPadding = value),
            ),
          )
        ]),
        Row(
          children: [
            Text('水平内间距:'),
            Expanded(
              child: Slider(
                min: 0,
                max: 50,
                value: _hPadding,
                onChanged: (value) => setState(() => _hPadding = value),
              ),
            )
          ],
        ),
        Row(
          children: [
            Text('颜色:'),
            Expanded(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children:
                    [Colors.transparent, ...Colors.primaries, Colors.white].map((color) {
                  final isSelected = _color == color;
                  return GestureDetector(
                    onTap: () => setState(() => _color = color),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: color),
                      child: isSelected ? Icon(Icons.check) : null,
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
        Row(children: [
          Text('边框粗细'),
          Expanded(
            child: Slider(
              min: 0,
              max: 5,
              value: _borderWidth,
              onChanged: (double value) => setState(() => _borderWidth = value),
            ),
          )
        ]),
        Row(
          children: [
            Text('边框颜色:'),
            Expanded(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children:
                    [Colors.transparent, ...Colors.primaries].map((color) {
                  final isSelected = _borderColor == color;
                  return GestureDetector(
                    onTap: () => setState(() {
                      _borderColor = color;
                    }),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                      child: isSelected ? Icon(Icons.check) : null,
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ],
    );
  }
}
