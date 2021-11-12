import 'package:flutter/material.dart';

class CustomPageNavigationAnimation {
  final AxisDirection direction;
  final Widget child;
  final BuildContext context;
  CustomPageNavigationAnimation({required this.context, required this.direction, required this.child});
  void pushPageAsync() {
    Navigator.push(
      context,
      PageRouteBuilder(
          fullscreenDialog: true,
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionsBuilder: (context, animation, animationTime, child) {
            return SlideTransition(
              position: Tween<Offset>(begin: getBeginOffset(), end: Offset.zero)
                  .animate(animation),
              child:  child,
            );
          }),
    );
  }

  getBeginOffset() {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
    //break;
      case AxisDirection.down:
        return const Offset(0, -1);
    //break;
      case AxisDirection.right:
        return const Offset(-1, 0);
    //break;
      case AxisDirection.left:
        return const Offset(1, 0);
    //break;
      default:
        return const Offset(1, 0);
    }
  }
  void popPageAsync() {
    Navigator.pop(context);
  }
  void pushReplacement() {
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>child));

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
          fullscreenDialog: true,
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionsBuilder: (context, animation, animationTime, child) {
            return SlideTransition(
              position: Tween<Offset>(begin: getBeginOffset(), end: Offset.zero)
                  .animate(animation),
              child: child,
            );
          }),
    );
  }
void heroAnimation(){

}
}