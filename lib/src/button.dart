import 'package:custom_ui/custom_ui.dart';
import 'package:custom_ui/src/color.dart';
import 'package:flutter/material.dart';

class CButton extends StatefulWidget {
  const CButton({
    super.key,
    this.child = const Text('CButton'),
    this.type = CColorType.normal,
    this.color,
    this.padding = const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.border,
    this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onDoubleTap,
    this.onLongPress,
    this.onSecondaryTap,
    this.onSecondaryTapUp,
    this.onSecondaryTapDown,
    this.onSecondaryTapCancel,
  });

  final EdgeInsetsGeometry padding;

  final Widget child;

  final Color? color;

  final CColorType type;

  final BorderRadiusGeometry borderRadius;

  final BoxBorder? border;

  final GestureTapCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final GestureTapCallback? onTapCancel;
  final GestureTapCallback? onDoubleTap;
  final GestureLongPressCallback? onLongPress;
  final GestureTapCallback? onSecondaryTap;
  final GestureTapUpCallback? onSecondaryTapUp;
  final GestureTapDownCallback? onSecondaryTapDown;
  final GestureTapCallback? onSecondaryTapCancel;

  @override
  State<CButton> createState() => _CButtonState();
}

class _CButtonState extends State<CButton> {
  bool _tapping = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? CTheme.of(context).colorByType(widget.type);
    final childColor =
        color.computeLuminance() > 0.5 || color == Colors.transparent
            ? Colors.black
            : Colors.white;
    return GestureDetector(
      onPanDown: (_) => setState(() => _tapping = true),
      onPanEnd: (_) => setState(() => _tapping = false),
      onPanCancel: () => setState(() => _tapping = false),
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      onTapDown: widget.onTapDown,
      onTapUp: widget.onTapUp,
      onTapCancel: widget.onTapCancel,
      onDoubleTap: widget.onDoubleTap,
      onLongPress: widget.onLongPress,
      onSecondaryTap: widget.onSecondaryTap,
      onSecondaryTapUp: widget.onSecondaryTapUp,
      onSecondaryTapDown: widget.onSecondaryTapDown,
      onSecondaryTapCancel: widget.onSecondaryTapCancel,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: DefaultTextStyle(
          style: TextStyle(color: childColor),
          child: IconTheme(
            data: IconThemeData(color: childColor),
            child: AnimatedContainer(
              padding: widget.padding,
              decoration: BoxDecoration(
                color: _tapping ? color.darken() : color,
                borderRadius: widget.borderRadius,
                border: widget.border,
              ),
              duration: Duration(milliseconds: 150), // TODO: 自定义动画时长
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
