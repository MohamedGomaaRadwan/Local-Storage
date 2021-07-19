import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveAppColor{
  late SharedPreferences prefs;
  saveData(int color) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('favColor', color);
  }

  Future<int> getData() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getInt('favColor') ?? Colors.white.value;
  }

}