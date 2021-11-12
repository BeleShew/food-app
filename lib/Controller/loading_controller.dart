import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoadingController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    configureLoading();
    addLoadingStatus();
  }

  void showHud(String data){
    EasyLoading.show(status: data);
  }
  void dismissHud(){
    EasyLoading.dismiss();
  }
  void configureLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = false
      ..toastPosition=EasyLoadingToastPosition.top
      ..dismissOnTap = false;

    // ..customAnimation = CustomAnimation();
  }

  void addLoadingStatus() {
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
    });
  }

  void removeLoadingStatus() {
    EasyLoading.removeCallback((status) {
      print('EasyLoading Status $status');
    });
    EasyLoading.removeAllCallbacks();
  }

}
