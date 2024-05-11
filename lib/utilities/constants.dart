import 'package:flutter/material.dart';

const kMessageSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: "Type your message",
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(
      color: Colors.lightBlueAccent,
      width: 2.0,
    ),
  ),
);

const kRoundTextFieldHintTextStyle = TextStyle(
  color: Colors.grey,
  fontWeight: FontWeight.w400,
);

const kRoundTextFieldContentPadding = EdgeInsets.symmetric(
  vertical: 10.0,
  horizontal: 20.0,
);

const kRoundTextFieldEnabledBorderSide = BorderSide(
  color: Colors.lightBlueAccent,
  width: 1.0,
);

const kRoundTextFieldFocusedBorderSide = BorderSide(
  color: Colors.lightBlueAccent,
  width: 2.0,
);

const _kRoundTextFieldBorderRadius = BorderRadius.all(Radius.circular(32.0));

const kRoundTextFieldDecoration = InputDecoration(
  hintText: "",
  hintStyle: kRoundTextFieldHintTextStyle,
  contentPadding: kRoundTextFieldContentPadding,
  border: OutlineInputBorder(
    borderRadius: _kRoundTextFieldBorderRadius,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: kRoundTextFieldEnabledBorderSide,
    borderRadius: _kRoundTextFieldBorderRadius,
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: kRoundTextFieldFocusedBorderSide,
    borderRadius: _kRoundTextFieldBorderRadius,
  ),
);

const kRoundTextFieldTextStyle = TextStyle(
  color: Colors.black,
);
