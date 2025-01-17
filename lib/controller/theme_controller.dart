import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class ThemeController extends GetxController {
  
  Rx<ThemeMode> currentTheme = ThemeMode.system.obs;

  void switchTheme() {
   currentTheme.value = currentTheme.value==ThemeMode.light ? ThemeMode.dark:ThemeMode.light;
  }
}
