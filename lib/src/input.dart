import 'package:flutter/material.dart';

class CInput extends StatefulWidget {
  const CInput({
    super.key,
    this.type,
    this.prefix,
    this.suffix,
    this.showClearIcon = false,
    this.cntlr,
    this.hintText,
  });

  final CInputType? type;

  final Widget? prefix;

  final Widget? suffix;

  final bool showClearIcon;

  final TextEditingController? cntlr;
  
  final String? hintText;

  @override
  State<CInput> createState() => _CInputState();
}

class _CInputState extends State<CInput> {
  late bool _obscureText;
  late bool _isEmpty;

  late final _cntlr = widget.cntlr ?? TextEditingController();

  @override
  void initState() {
    super.initState();
    _obscureText = widget.type == CInputType.password;
    _isEmpty = _cntlr.text.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _cntlr,
      keyboardType:
          widget.type == CInputType.number ? TextInputType.number : null,
      onChanged: (value) {
        final isEmpty = value.isEmpty;
        if (_isEmpty != isEmpty) {
          setState(() => _isEmpty = isEmpty);
        }
      },
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: widget.prefix,
        suffixIcon: _buildSuffix(),
        isDense: true,
        contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildSuffix() {
    List<Widget> children = [];
    if (widget.suffix != null) children.add(widget.suffix!);
    if (widget.type == CInputType.password) {
      children.add(
        IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () => setState(() => _obscureText = !_obscureText),
        ),
      );
    }
    if (widget.showClearIcon) {
      children.add(
        IconButton(
          icon: Icon(
            Icons.clear,
            color: _isEmpty ? Colors.grey : null,
          ),
          onPressed: _isEmpty
              ? null
              : () {
                  _cntlr.clear();
                  setState(() => _isEmpty = true);
                },
        ),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}

enum CInputType {
  number,
  password,
}
