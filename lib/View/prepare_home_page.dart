import 'package:flutter/material.dart';
class PrepareHomePage extends StatelessWidget {
  const PrepareHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return  SizedBox(
              height: 200,
              width: 200,
              child: Card(
                color: Colors.indigo,
                elevation: 24,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                    child: Text(
                      "data ${index.toString()}",
                      style: const TextStyle(color: Colors.white),
                    )),
              ),
            );
          }),
    );
  }
}
