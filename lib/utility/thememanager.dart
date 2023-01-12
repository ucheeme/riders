import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:riders/utility/sharedPref.dart';




class ThemeNotifier with ChangeNotifier {


  Rx<ThemeData> darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    colorScheme: ColorScheme.light(
        brightness: Brightness.dark,
        onSecondary: Colors.white,
        secondary: Colors.white,
        primary: Colors.white,
        onPrimary: Colors.white
    ),
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  ).obs;

  Rx<ThemeData> lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  ).obs;

  Rx<ThemeData> _themeData=ThemeData().obs;
  ThemeData getTheme() => _themeData.value;

  ThemeNotifier() {
    SharedPref.read('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData.value = lightTheme.value;
      } else {
        print('setting dark theme');
        _themeData.value = darkTheme.value;
      }
      //  notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData.value = darkTheme.value;
    SharedPref.save('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData.value = lightTheme.value;
    SharedPref.save('themeMode', 'light');
    //notifyListeners();
  }
}