import 'package:bestfood/Constants/navigation.dart';
import 'package:bestfood/Model/registration_model.dart';
import 'package:bestfood/View/register_page.dart';
import 'package:bestfood/View/verification_page.dart';
import 'package:bestfood/Widget/dismiss_keyboard.dart';
import 'package:bestfood/Widget/toast_messages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'email_controller.dart';
import 'loading_controller.dart';

class LoginController extends GetxController {
  List<RegistrationModel> registeredHotel = [];
  var loadingController = Get.find<LoadingController>();

  var emailController = Get.find<EmailController>();
  final collectionReference =
      FirebaseFirestore.instance.collection("RegistrationCollection");

  final FirebaseAuth _auth = FirebaseAuth.instance;
  var verificationIds = ''.obs;
  var isUserLoggedIn = false.obs;
  var smsCodes = "".obs;
  var firstOTP = "".obs,
      secondOTP = "".obs,
      thirdOTP = "".obs,
      fourthOTP = "".obs,
      fifthOTP = "".obs,
      sixthOTP = "".obs;

  usersLogin(String email, String password, context) async {
    try {
      DismissKeyboard(context);
      loadingController.showHud("Please Wait");
      await getUsersList();
      if (registeredHotel.isNotEmpty) {
        var isUserExist =
            registeredHotel.where((element) => element.email == email);
        if (isUserExist.isEmpty) {
          loadingController.dismissHud();
          ToastMessage.showToast(
              context,
              "Incorrect email and password, please try again.",
              Colors.deepOrangeAccent);
          return;
        } else {
          loadingController.dismissHud();
          ToastMessage.showToast(context, "Successfully Login.", Colors.green);
          CustomPageNavigationAnimation(
            context: context,
            child: const RegisterPage(),
            direction: AxisDirection.up,
          ).heroAnimation();
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future getUsersList() async {
    try {
      registeredHotel = [];
      await collectionReference.get().then((value) {
        for (var doc in value.docs) {
          final signUp = RegistrationModel.fromJson(doc.data());
          registeredHotel.add(signUp);
          //print(doc.data());
        }
      });
    } catch (e) {
      print(e);
    }
    return registeredHotel;
  }

  phoneVerification(context) async {
    try {
      loadingController.showHud("Please Wait");
      await _auth.verifyPhoneNumber(
          phoneNumber: '+251930774896',
          verificationCompleted: (phoneAuthCredential) async {
            loadingController.dismissHud();
          },
          verificationFailed: (verificationFailed) async {
            ToastMessage.showToast(
                context, verificationFailed.message, Colors.deepOrangeAccent);
            loadingController.dismissHud();
          },
          codeSent: (verificationId, resendingToken) async {
            verificationIds.value = verificationId;
            loadingController.dismissHud();
            CustomPageNavigationAnimation(
              context: context,
              child: const PhoneVerificationPage(),
              direction: AxisDirection.up,
            ).heroAnimation();
          },
          timeout: const Duration(seconds: 60),
          codeAutoRetrievalTimeout: (verificationId) async {});
    } on FirebaseAuthException catch (ex) {
      loadingController.dismissHud();
      ToastMessage.showToast(context, ex.message, Colors.deepOrangeAccent);
    }
  }

  phoneAuthCredential(context) async {
    PhoneAuthCredential _phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationIds.value, smsCode: smsCodes.value);
    signInWithPhoneAuthCredential(_phoneAuthCredential, context);
  }

  signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential, context) async {
    try {
      loadingController.showHud("Please Wait");

      final _authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      if (_authCredential.user!.phoneNumber != null) {
        CustomPageNavigationAnimation(
          context: context,
          child: const RegisterPage(),
          direction: AxisDirection.up,
        ).heroAnimation();
      }
      loadingController.dismissHud();
    } on FirebaseAuthException catch (e) {
      loadingController.dismissHud();
      ToastMessage.showToast(context, e.message, Colors.deepOrangeAccent);
    }
  }

  signOut() async {
    await _auth.signOut();
  }

  checkIsUserAlreadyLogin() async {
    User _user = _auth.currentUser!;
    if (_user != null) {
      isUserLoggedIn.value = true;
    } else {
      isUserLoggedIn.value = false;
    }
    return isUserLoggedIn.value;
  }

  signInWithEmailAndPassword(context, String email, String password) async {
    try {
      loadingController.showHud("Please Wait");
      var usersList = await _auth.fetchSignInMethodsForEmail(email);
      if (usersList.isNotEmpty) {
        var loginEmailAndPassword = await _auth.signInWithEmailAndPassword(email: email, password: password);
        if (loginEmailAndPassword.user!.email != null) {
          ToastMessage.showToast(context, "Login Successfully", Colors.green);
        }
      } else {
        // createUserWithEmailAndPassword(context,email,password);
        ToastMessage.showToast(context, "User Does not Exist! Please register first", Colors.orangeAccent);
      }
      loadingController.dismissHud();
    } on FirebaseAuthException catch (ex) {
      loadingController.dismissHud();
      ToastMessage.showToast(context, ex.message, Colors.deepOrangeAccent);
    }
  }

  createUserWithEmailAndPassword(context, String email,String password) async{
    try {
      loadingController.showHud("Please Wait");
      var createUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (createUser.user!.email != null) {
        ToastMessage.showToast(context, "Register user Successful", Colors.green);
      }
      loadingController.dismissHud();
    } on FirebaseAuthException catch (ex) {
      loadingController.dismissHud();
      ToastMessage.showToast(context, ex.message, Colors.deepOrangeAccent);
    }
  }
}
