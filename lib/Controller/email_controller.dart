import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EmailController extends GetxController {
  late TextEditingController emailController;
  var email = '';
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }
  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }
  String? validateEmail(String values) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,4}$").hasMatch(values);
    if(!emailValid)
      {
        return "Provide a valid Email";
      }
    return null;
  }
}
