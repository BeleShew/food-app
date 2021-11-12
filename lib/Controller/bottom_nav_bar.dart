
import 'package:get/get.dart';
class BottomNavBarController extends GetxController{
final  _currentIndex=0.obs;
int get selectedIndex=>_currentIndex.value;
  currentIndexChanged(int selectedIndex){
    _currentIndex.value=selectedIndex ;
  }
}