import 'dart:ui';

import 'package:bestfood/Constants/header_divider.dart';
import 'package:bestfood/Constants/text_input_decoration.dart';
import 'package:bestfood/Widget/clip_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade300,
      appBar: AppBar(
        title: const Text("Forget Password"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    child: ClipPath(
                      clipper: WaveClipperOne(),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.15,
                        decoration:
                            BoxDecoration(color: Colors.orange.shade100),
                        child: Container(),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: ClipPath(
                      clipper: WaveClipperOne(),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration:
                            BoxDecoration(color: Colors.grey.shade700),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height /1,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Card(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        keyboardType: TextInputType.phone,
                                        decoration: TextInputDecoration
                                            .borderLessInputDecoration(
                                                "Email", "Email", Colors.black),
                                      ),
                                    ),
                                    HeaderDivider.headerDivider(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextButton(
                                        clipBehavior: Clip.antiAlias,
                                        onPressed: () async {},
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade200),
                                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(5)),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(10),),
                                            //side: BorderSide(color: Colors.red)
                                          ))
                                        ),
                                        child: Container(
                                          constraints: const BoxConstraints(
                                              minHeight: 60.0),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            "Forget Password",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Text("data1"),
                              // Text("data2"),
                              // Text("data3"),
                              // Text("data4")
                            ],
                          ),
                          // child:   Card(
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Text("data"),
                          //   ),
                          // ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
