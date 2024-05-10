import 'package:flash_chat_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';

class RoundTextField extends StatelessWidget {
  final String hintText;
  final Function onValueChanged;
  final bool? isPasswordField;

  const RoundTextField({
    super.key,
    this.isPasswordField,
    required this.hintText,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => onValueChanged(value),
      obscureText: (isPasswordField != null) ? true : false,
      decoration: kRoundTextFieldDecoration.copyWith(
        hintText: hintText,
      ),
      style: kRoundTextFieldTextStyle,
    );
  }
}
