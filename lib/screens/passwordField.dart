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
    this.labelText,
  });

  final Key? fieldKey;
  final String? hintText;
  final String labelText;
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
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
          filled: true,
          hintText: widget.hintText,
          labelText: widget.labelText,
          helperText: widget.helperText,
          suffixIcon: GestureDetector(
            onTap: (){
              setState((){
                _obscureText = !_obscureText;
          });
          },
            child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          ),
        ),
    );
  }
}
