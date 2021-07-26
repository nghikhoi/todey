import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todey/services/notification_service.dart';
import 'package:todey/utils/formatted_date.dart';

class EventController extends GetxController {
  //
  //this guy doesnt really do anything im just trying to make code more readable
  //im trying to create another controller so i can taka advantages of few things

  var dateNow = DateTime.now();
  var timeNow = TimeOfDay.now();
  var pageController = PageController().obs;
  var titleController = TextEditingController().obs;
  var noteController = TextEditingController().obs;
  var eventCategory = "Important".obs;
  var eventCreatedDate = formattedDate();
  var eventDate = DateTime.now().obs;
  var eventStartedTime = TimeOfDay.now().obs;
  var eventEndedTime = TimeOfDay.now().obs;
  var eventType = "Personal".obs;
  var selectedIndex = 0.obs;

  @override
  void onReady() {
    super.onReady();
    notification.setOnNotificationClick(onNotificationClick);
  }

  onNotificationClick() {
    print("Clicked Notification");
  }

  /// fires when  controller is disposed
  @override
  void dispose() {
    super.dispose();
    pageController.value.dispose();
    titleController.value.dispose();
    noteController.value.dispose();
  }
}
