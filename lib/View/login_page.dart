import 'package:bestfood/Constants/constants.dart';
import 'package:bestfood/Constants/navigation.dart';
import 'package:bestfood/View/register_page.dart';
import 'package:bestfood/Widget/clip_path.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login"),centerTitle: true,),
      backgroundColor: Colors.grey,
      body: Card(
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: Constants.registrationTag,
                child: GestureDetector(
                  onTap: (){
                    CustomPageNavigationAnimation(context: context, child: const RegisterPage(), direction: AxisDirection.up,).pushPageAsync();
                  },
                  child: ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(color: Colors.orange),
                      child: Image.asset("assets/images/login.jpg",fit: BoxFit.fill,),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.phone,
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
                keyboardType: TextInputType.text,
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
                  //formController.validateUserInput(context);
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
