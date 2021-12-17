import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PasswordController extends GetxController {

  var isVisible = true.obs;
  late TextEditingController passwordController;
  var password = '';
  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
  }
  @override
  void onClose() {
    super.onClose();
    passwordController.dispose();
  }
  bool isPasswordVisible() {
    isVisible.value=!isVisible.value;
    return isVisible.value;
  }
  String? validatePassword(String values) {
    bool passwordIsValid = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(values);
    if(!passwordIsValid)
    {
      return "Provide a valid password";
    }
    return null;
  }
}