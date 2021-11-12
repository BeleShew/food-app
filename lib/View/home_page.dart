import 'package:bestfood/Controller/bottom_nav_bar.dart';
import 'package:bestfood/View/prepare_home_page.dart';
import 'package:bestfood/View/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'best_fare_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bottomNavController=Get.put(BottomNavBarController());
    var pageList=[const PrepareHomePage(),const BestFarePage(),const LoginPage()];
    return Scaffold(
      bottomNavigationBar: GetX<BottomNavBarController>(
        builder: (controllers) {
          return BottomNavigationBar(
            currentIndex:  controllers.selectedIndex,
            elevation: 30,
            selectedItemColor: Colors.green[300],
            unselectedItemColor: Colors.grey[400],
            selectedFontSize: 16,
            unselectedFontSize: 14,
            onTap: (int index){
              //provider.currentIndexChanged(index);
              bottomNavController.currentIndexChanged(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.room_preferences_sharp),
                label: 'Best Fare',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.app_registration_rounded),
                label: 'Login',
              ),
            ],
          );
        }
      ),
      body: GetX<BottomNavBarController>(
        builder: (controller) {
          return pageList[controller.selectedIndex];
        }
      )
    );
  }
}
