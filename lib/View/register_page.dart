import 'package:bestfood/Constants/constants.dart';
import 'package:bestfood/Controller/text_field_controller.dart';
import 'package:bestfood/Widget/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    var formController = Get.put(TextFieldController());
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Register"),
        centerTitle: true,
      ),
      body: Form(
       key: formController.registrationForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // GestureDetector(
                  //   onTap: () async {
                  //     await imageController.pickerImages();
                  //     formController.base64Image=imageController.base64Image;
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Center(
                  //       child: GetX<ImagePickersController>(
                  //         builder: (logic) {
                  //           return Container(
                  //             width: 100,
                  //             height: 100,
                  //             decoration: const BoxDecoration(
                  //                 color: Colors.lightGreen,
                  //                 shape: BoxShape.circle),
                  //             child: logic.selectedImage.value.isNotEmpty
                  //                 ? Stack(children: [
                  //                     Container(
                  //                       decoration: BoxDecoration(
                  //                         shape: BoxShape.circle,
                  //                         image: DecorationImage(
                  //                             fit: BoxFit.fill,
                  //                             image: FileImage(File(
                  //                                 logic.selectedImage.value))),
                  //                       ),
                  //                     ),
                  //                     const Center(
                  //                       child: Icon(
                  //                         Icons.add_a_photo_sharp,
                  //                         color: Colors.white,
                  //                         size: 30,
                  //                       ),
                  //                     ),
                  //                   ])
                  //                 : const Icon(Icons
                  //                     .add_a_photo_sharp), //const Icon(imageController.selectedImage):const Icon(Icons.add_a_photo_sharp),
                  //           );
                  //         },
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  // Stack(children: [
                  //   ClipPath(
                  //     clipper: CustomClipPath(),
                  //     child: Container(
                  //       height: 200,
                  //       decoration: const BoxDecoration(color: Colors.red),
                  //     ),
                  //   ),
                  //   ClipPath(
                  //     clipper: CustomClipPath(),
                  //     child: Container(
                  //       height: 150,
                  //       decoration: const BoxDecoration(color: Colors.green),
                  //     ),
                  //   ),
                  // ],),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: formController.nameController,
                      onSaved: (values) {
                        formController.name = values!;
                      },
                      validator: (values) {
                        return formController.validateName(values!);
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: "Restaurant Name",
                        focusedBorder: InputBorder.none,
                        hintText: "Restaurant Name",
                        focusColor: Colors.black,
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
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
                    child: TextFormField(
                      controller: formController.phoneController,
                      onSaved: (values) {
                        formController.phone = values!;
                      },
                      validator: (values) {
                        return formController.validatePhoneNumber(values!);
                      },
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: "Phone",
                        focusedBorder: InputBorder.none,
                        hintText: "Phone",
                        focusColor: Colors.black,
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
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
                    child: TextFormField(
                      controller: formController.emailController,
                      onSaved: (values) {
                        formController.email = values!;
                      },
                      validator: (values) {
                        return formController.validateEmail(values!);
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
                  Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: formController.websiteController,
                      onSaved: (values) {
                        formController.website = values!;
                      },
                      validator: (values) {
                        return formController.validateWebsite(values!);
                      },
                      keyboardType: TextInputType.url,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: "Website",
                        focusedBorder: InputBorder.none,
                        hintText: "Website",
                        focusColor: Colors.black,
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
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
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextButton(
                      onPressed: () async {
                        formController.validateUserInput(context);
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
