import 'package:flutter/material.dart';

class CustomButton{
 static gradientButton( String text){
   return Container(
      height: 70.0,
      margin: const EdgeInsets.all(10),
      child: TextButton(
        style: ButtonStyle(
         // backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                    //side: BorderSide(color: Colors.red)
                )
            )
        ),
        onPressed: (){},
        child: Ink(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints:
            const BoxConstraints(minHeight: 70.0),
            alignment: Alignment.center,
            child:  Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}