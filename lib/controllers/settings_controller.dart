import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todey/services/sp_service.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingController extends GetxController {
  //
  var isNotification = false.obs;
  var isDailyReminder = false.obs;
  var defaultLanguage = 'en, US'.obs;
  SP spService = SP();

  @override
  void onReady() {
    super.onReady();
    spService.getLanguage(defaultLanguage.value);
  }

  // change language
  changeLanguage(param1, param2) {
    var locale = Locale(param1, param2);
    Get.updateLocale(locale);
    //save state of current language
    spService.setLanguage(param1, param2);
    print('$param1, $param2');
  }

  // switch flip

  flipSwitch(value) {
    value = !value;
    print(value);
  }

  // launch url
  launchGmail() async {
    final Uri params = Uri(
        scheme: 'mailto',
        path: 'flutterboyfriend200@gmail.com',
        query: 'subject=Suggest A Feature Todey&body= ');
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch gmail');
    }
  }

  //Report a problem
  reportProblem() async {
    final Uri params = Uri(
        scheme: 'mailto',
        path: 'flutterboyfriend200@gmail.com',
        query: 'subject=Report A Problem Todey&body= ');
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch gmail');
    }
  }

  launchTwitter() async {
    final String url = 'https://www.twitter.com/@flutterboy1';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch twitter');
    }
  }
}
