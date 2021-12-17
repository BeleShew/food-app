import 'package:bestfood/Constants/constants.dart';
import 'package:bestfood/Constants/navigation.dart';
import 'package:bestfood/Controller/email_controller.dart';
import 'package:bestfood/Controller/login_controller.dart';
import 'package:bestfood/Controller/password_controller.dart';
import 'package:bestfood/View/forget_password_page.dart';
import 'package:bestfood/View/register_page.dart';
import 'package:bestfood/View/verification_page.dart';
import 'package:bestfood/Widget/clip_path.dart';
import 'package:bestfood/Widget/toast_messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = Get.put(EmailController());
    var passwordController = Get.put(PasswordController());
    var loginController = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // CustomPageNavigationAnimation(
                  //   context: context,
                  //   child: const RegisterPage(),
                  //   direction: AxisDirection.up,
                  // ).heroAnimation();
                },
                child: ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.orange),
                    child: Image.asset(
                      "assets/images/login.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: Constants.emailForm,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: emailController.emailController,
                    onSaved: (values) {
                      emailController.email = values!;
                    },
                    validator: (values) {
                      return emailController.validateEmail(values!);
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: "Email",
                      focusedBorder: InputBorder.none,
                      hintText: "Email",
                      focusColor: Colors.black,
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: GetX<PasswordController>(
                        builder: (logic) {
                          return Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            key: Constants.passwordKey,
                            child: TextFormField(
                              controller: passwordController.passwordController,
                              onSaved: (values) {
                                passwordController.password = values!;
                              },
                              validator: (values) {
                                return passwordController
                                    .validatePassword(values!);
                              },
                              keyboardType: TextInputType.text,
                              obscureText: logic.isVisible.value,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: "Password",
                                focusedBorder: InputBorder.none,
                                hintText: "Password",
                                focusColor: Colors.black,
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        passwordController.isPasswordVisible();
                      },
                      child: GetX<PasswordController>(builder: (snapShat) {
                        return snapShat.isVisible.value
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility);
                      }),
                    )
                  ],
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey,
              ),

              Container(
                margin: const EdgeInsets.only(
                    left: 5, top: 10, bottom: 10, right: 5),
                width: MediaQuery.of(context).size.width,
                //decoration: BoxDecoration(
                    //color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                child: TextButton(
                  clipBehavior: Clip.antiAlias,
                  onPressed: () async {
                    if (Constants.emailForm.currentState!.validate() &&
                        Constants.passwordKey.currentState!.validate()) {
                      loginController.signInWithEmailAndPassword(context,emailController.emailController.text,passwordController.passwordController.text);
                      // loginController.usersLogin(emailController.emailController.text,
                      //     passwordController.password, context);
                    } else {
                      return;
                    }
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0),
                            //side: BorderSide(color: Colors.red)
                          )
                      )
                  ),
                  child:  Ink(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      constraints:
                      const BoxConstraints(minHeight: 60.0),
                      alignment: Alignment.center,
                      child: const Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
              //CustomButton.gradientButton("Login")

             GestureDetector(
               onTap: (){
                 CustomPageNavigationAnimation(
                   context: context,
                   child: const ForgetPasswordPage(),
                   direction: AxisDirection.up,
                 ).heroAnimation();
               },
               child: Container(
                  width: MediaQuery.of(context).size.width,
                  height:70,
                  padding:const EdgeInsets.only(right: 10,top: 20),
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.end,
                  ),
                ),
             )
            ],
          ),
        ),
      ),
    );
  }

}
