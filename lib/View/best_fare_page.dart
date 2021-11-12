import 'package:bestfood/Constants/constants.dart';
import 'package:flutter/material.dart';

class BestFarePage extends StatelessWidget {
  const BestFarePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title:const Text("Best Fare"),centerTitle: true,),
      body: Center(
        child:  Hero(tag: Constants.bestFareTag, child: const Text("Best Fare Page")),
      ),
    );
  }
}
