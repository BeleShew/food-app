import 'package:flutter/material.dart';

class TextInputDecoration{
  static borderLessInputDecoration(String? labelText, String? hintText,Color? textColors){
  return  InputDecoration(
    border: InputBorder.none,
    labelText: labelText,
    focusedBorder: InputBorder.none,
    hintText: hintText,
    focusColor: Colors.black,
    labelStyle: TextStyle(
      color: textColors,
      fontSize: 13,
    ),
  );
  }
}