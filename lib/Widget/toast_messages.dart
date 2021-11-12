import 'dart:ui';

import 'package:flutter/material.dart';

 class ToastMessage {

  static void showToast(context,messages,Color colors) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: colors,
        content: Text(messages,style: const TextStyle(color: Colors.white,),),
        //action: SnackBarAction(label: action1, onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}