import 'package:get/state_manager.dart';
// used getx package for state management

class BottomNavigationController extends GetxController {
  var tabIndex = 0.obs; // observable variable

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
