import 'package:bestfood/Controller/text_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class TextFormWidget extends StatelessWidget {
  const  TextFormWidget({Key? key,this.controller, this.labelText, this.hintText, this.keyboardType,}) : super(key: key);
  final labelText,hintText;
  final keyboardType;
  final controller;

  @override

  Widget build(BuildContext context) {
    var txtController=Get.put(TextFieldController());
    return TextFormField(
      controller: controller,
      onSaved: (value){
        txtController.customInput=value!;
      },
      validator: (value){
       // txtController.inputValidation(value!, keyboardType!);
      },
      decoration:  InputDecoration(
        border: InputBorder.none,
        labelText: labelText,
        focusedBorder: InputBorder.none,
        hintText: hintText,
        focusColor: Colors.black,
        labelStyle:const TextStyle(
          color: Colors.black,
          fontSize: 13,
        ),
      ),
    );
  }
}
