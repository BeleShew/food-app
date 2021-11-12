
import 'package:bestfood/Model/registration_model.dart';
import 'package:bestfood/Widget/dismiss_keyboard.dart';
import 'package:bestfood/Widget/toast_messages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'loading_controller.dart';

class TextFieldController extends GetxController {
  final GlobalKey<FormState> registrationForm = GlobalKey<FormState>();
  var base64Image="".obs;
  late TextEditingController emailController,
      phoneController,
      websiteController,
      nameController;
  var email = '', name = '', phone = '', website = '';
  var customInput = '';
  var fireBaseReference = FirebaseDatabase.instance.reference();
  final collectionReference =
      FirebaseFirestore.instance.collection("RegistrationCollection");

  List<RegistrationModel> registeredHotel = [];
  var loadingController = Get.find<LoadingController>();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    websiteController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    phoneController.dispose();
    websiteController.dispose();
    nameController.dispose();
  }

  String? validateEmail(String values) {
    if (!GetUtils.isEmail(values)) {
      return "Provide a valid Email";
    }
    return null;
  }

  String? validateWebsite(String values) {
    if (!GetUtils.isURL(values)) {
      return "Provide a valid Website Link";
    }
    return null;
  }

  String? validateName(String values) {
    if (!GetUtils.isUsername(values)) {
      return "Provide a valid user name";
    }
    return null;
  }

  String? validatePhoneNumber(String values) {
    if (!GetUtils.isPhoneNumber(values)) {
      return "Provide a valid Phone number";
    }
    return null;
  }

  Future<void> validateUserInput(BuildContext context) async {
    var validate = registrationForm.currentState!.validate();
    if (!validate) {
      return;
    } else {
      loadingController.showHud("Loading");

      // #region Store in real time data base
      // fireBaseReference.child("BestFood").push().set({
      //   'Restaurant_Name':formController.nameController.text,
      //   'PhoneNumber':formController.phoneController.text,
      //   'Email':formController.emailController.text,
      //   'website':formController.websiteController.text,
      // });
// #end region

      Map<String, dynamic> fireStoreDatabase = {
        "Restaurant_Name": nameController.text,
        "PhoneNumber": phoneController.text,
        "Email": emailController.text,
        "website": websiteController.text,
        // "base64Image":base64Image.value,
      };
      DismissKeyboard(context);

      await getUsersData();
      if(registeredHotel.isNotEmpty)
        {
          var isUserExist=registeredHotel.where((element) => element.email==emailController.text);
          if(isUserExist.isNotEmpty)
            {
              loadingController.dismissHud();
              ToastMessage.showToast(context,"Email already exist, Please try another email address.",Colors.deepOrangeAccent);
              return;
            }
          else
            {
              collectionReference.add(fireStoreDatabase);
              ToastMessage.showToast(context,"Successfully registered.",Colors.green);
            }
        }
    }
    registrationForm.currentState!.save();
    loadingController.dismissHud();
  }

  Future getUsersData() async {
    registeredHotel=[];
    await collectionReference.get().then((value) {
      value.docs.forEach((doc) {
          final signUp = RegistrationModel.fromJson(doc.data());
          registeredHotel.add(signUp);
        //print(doc.data());
      });
    });
    return registeredHotel;
  }
}
