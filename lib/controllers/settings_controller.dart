import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todey/constants/string_constant.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingController extends GetxController {
  var theme = true.obs;
  var notification = true.obs;
  var reminder = true.obs;

  var defaultLanguage = 'en, US'.obs;

  static final SettingController instance = Get.put(SettingController());

  @override
  void onReady() {
    super.onReady();
  }

  // change language
  changeLanguage(param1, param2) {
    var locale = Locale(param1, param2);
    Get.updateLocale(locale);
    print('$param1, $param2');
    update();
  }

  // switch flip
  flipSwitch(value) {
    value = !value;
    print(value);
  }

  // launch url
  void launchGmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'flutterboyfriend200@gmail.com',
      query: 'subject= Suggest A Feature Todey&body = ',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch gmail');
    }
  }

  //Report a problem
  void reportProblem() async {
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

  void launchTwitter() async {
    final String url = 'https://www.twitter.com/@ichie200';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch twitter');
    }
  }

  Future<void> changeTheme(bool value) async {
    final box = await Hive.openBox<bool>(appTheme);
    if (value) {
      theme.value = true;
      Get.changeThemeMode(ThemeMode.dark);
      box.put(appThemeKey, true);
    } else {
      theme.value = false;
      Get.changeThemeMode(ThemeMode.light);
      box.put(appThemeKey, false);
    }
  }

  void showFeedback(context) {
    BetterFeedback.of(context).show((UserFeedback feedback) {
      print(feedback.text);
    });
  }
}
