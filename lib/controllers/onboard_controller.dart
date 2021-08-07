import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todey/utils/constant.dart';
import 'package:todey/utils/helper.dart';

class OnboardController extends GetxController {
  var pageController = PageController().obs;

  var selectedIndex = 0.obs;

  void pageChanged(index) {
    selectedIndex.value = index;
  }

  void navigatePage() {
    pageController.value.nextPage(
      curve: Curves.bounceInOut,
      duration: kDuration,
    );
  }

  void skipChanged() {}
}
