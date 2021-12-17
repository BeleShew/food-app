import 'package:bestfood/Constants/otp_verification_ui.dart';
import 'package:bestfood/Controller/login_controller.dart';
import 'package:bestfood/Widget/dismiss_keyboard.dart';
import 'package:bestfood/Widget/toast_messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneVerificationPage extends StatelessWidget {
  const PhoneVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var loginController = Get.find<LoginController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter Verification",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 85,
                  child: AspectRatio(
                    aspectRatio: 0.7,
                    child: TextField(
                      autofocus: true,
                      showCursor: false,
                      readOnly: false,
                      onChanged: (values) {
                        if (values.length == 1) {
                          FocusScope.of(context).nextFocus();
                          loginController.firstOTP.value = values;
                        }
                      },
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black),
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counter: const Offstage(),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.purple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 85,
                  child: AspectRatio(
                    aspectRatio: 0.7,
                    child: TextField(
                      autofocus: true,
                      showCursor: false,
                      readOnly: false,
                      onChanged: (values) {
                        loginController.secondOTP.value = values;
                        if (values.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                        if (values.isEmpty) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black),
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counter: const Offstage(),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.purple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 85,
                  child: AspectRatio(
                    aspectRatio: 0.7,
                    child: TextField(
                      autofocus: true,
                      showCursor: false,
                      readOnly: false,
                      onChanged: (values) {
                        loginController.thirdOTP.value = values;
                        if (values.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                        if (values.isEmpty) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black),
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counter: const Offstage(),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.purple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 85,
                  child: AspectRatio(
                    aspectRatio: 0.7,
                    child: TextField(
                      autofocus: true,
                      showCursor: false,
                      readOnly: false,
                      onChanged: (values) {
                        loginController.fourthOTP.value = values;
                        if (values.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                        if (values.isEmpty) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black),
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counter: const Offstage(),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.purple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 85,
                  child: AspectRatio(
                    aspectRatio: 0.7,
                    child: TextField(
                      autofocus: true,
                      showCursor: false,
                      readOnly: false,
                      onChanged: (values) {
                        loginController.fifthOTP.value = values;
                        if (values.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                        if (values.isEmpty) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black),
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counter: const Offstage(),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.purple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 85,
                  child: AspectRatio(
                    aspectRatio: 0.7,
                    child: TextField(
                      autofocus: true,
                      showCursor: false,
                      readOnly: false,
                      onChanged: (values) {
                        loginController.sixthOTP.value = values;
                        if (values.isEmpty) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black),
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counter: const Offstage(),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.purple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn't Receive the OTP ?",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Resend OTP",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                clipBehavior: Clip.antiAlias,
                onPressed: () async {
                  DismissKeyboard(context);
                  var allOTPCodes = loginController.firstOTP.value +
                      loginController.secondOTP.value +
                      loginController.thirdOTP.value +
                      loginController.fourthOTP.value +
                      loginController.fifthOTP.value +
                      loginController.sixthOTP.value;
                  if (allOTPCodes.isNotEmpty && allOTPCodes.length == 6) {
                    loginController.smsCodes.value = allOTPCodes;
                    loginController.phoneAuthCredential(context);
                  } else {
                    ToastMessage.showToast(
                        context,
                        "Verification Code length is not correct! Please try again",
                        Colors.deepOrangeAccent);
                  }
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue.shade200),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.all(5)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      //side: BorderSide(color: Colors.red)
                    ))),
                child: Container(
                  constraints: const BoxConstraints(minHeight: 60.0),
                  alignment: Alignment.center,
                  child: const Text(
                    "Verify",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
