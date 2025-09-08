import 'package:get/get.dart';

class NavigationController extends GetxController {
  final currentIndex = 0.obs;

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }

  void goToHome() {
    currentIndex.value = 0;
  }

  void goToDashboard() {
    currentIndex.value = 1;
  }

  void goToProfile() {
    currentIndex.value = 2;
  }

  void goToFindUser() {
    currentIndex.value = 3;
  }
}
