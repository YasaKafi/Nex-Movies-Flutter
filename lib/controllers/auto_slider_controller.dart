import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ControllerPage extends GetxController {


  final PageController pageController = PageController(

  );
  Timer? timer;

  final List<String> imageAssets = [
    'assets/promo.jpeg',
    'assets/promo2.jpeg',
    'assets/promo3.jpeg',
    'assets/promo4.jpeg',
    'assets/promo5.jpeg',
  ];


  int currentPage = 0;
  bool reverse = false;

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(
      const Duration(seconds: 2),
          (timer) {
        currentPage++;
        if (currentPage > imageAssets.length - 1) {
          currentPage = 0;
        }

        pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
