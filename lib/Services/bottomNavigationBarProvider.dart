
import 'package:flutter/cupertino.dart';
class BottomNavBarProvider extends ChangeNotifier
{
  int _currentIndex=0;
  int get selectedIndex=>_currentIndex;
  currentIndexChanged(int selectedIndex){
    _currentIndex=selectedIndex;
    notifyListeners();
  }
}