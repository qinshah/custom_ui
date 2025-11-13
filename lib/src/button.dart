import 'package:custom_ui/custom_ui.dart';
import 'package:flutter/material.dart';

class CButton extends InkResponse {
  @override
  get child => Padding(
        padding: padding,
        child: Center(child: Text(text)),
      );

  final String text;

  final CStyleTyoe type;

  final EdgeInsetsGeometry padding;
  const CButton(
    this.text, {
    this.type = CStyleTyoe.normal,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    super.key,
    super.child,
    super.onTap,
    super.onDoubleTap,
    super.onLongPress,
    super.onTapDown,
    super.onTapUp,
    super.onTapCancel,
    super.onSecondaryTap,
    super.onSecondaryTapUp,
    super.onSecondaryTapDown,
    super.onSecondaryTapCancel,
    super.onHighlightChanged,
    super.onHover,
    super.mouseCursor,
    super.focusColor,
    super.hoverColor,
    super.highlightColor,
    super.overlayColor,
    super.splashColor,
    super.splashFactory,
    super.radius,
    super.borderRadius,
    super.customBorder,
    super.enableFeedback,
    super.excludeFromSemantics,
    super.focusNode,
    super.canRequestFocus,
    super.onFocusChange,
    super.autofocus,
    super.statesController,
    super.hoverDuration,
  }) : super(containedInkWell: true, highlightShape: BoxShape.rectangle);
}
