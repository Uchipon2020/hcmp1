import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PassWordField extends StatefulWidget {
  const PassWordField({
    this.fieldKey,
    this.hintText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.lavelText,
  });

  final Key fieldKey;
  final String hintText;
  final String lavelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PassWordFieldState createState() => _PassWordFieldState();
}

class _PassWordFieldState extends State<PassWordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
