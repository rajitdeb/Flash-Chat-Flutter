import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Function onButtonPressed;
  final String btnText;
  final Color? btnColor;
  final double verticalPadding;

  const RoundButton({
    super.key,
    this.btnColor,
    this.verticalPadding = 16.0,
    required this.btnText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
      ),
      child: Material(
        elevation: 5.0,
        color: (btnColor != null) ? btnColor : Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () => onButtonPressed(),
          minWidth: 200.0,
          height: 42.0,
          child: Text(btnText),
        ),
      ),
    );
  }
}
