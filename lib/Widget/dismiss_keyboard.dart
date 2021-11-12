import 'package:flutter/material.dart';

class DismissKeyboard{
  DismissKeyboard( BuildContext context){
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}