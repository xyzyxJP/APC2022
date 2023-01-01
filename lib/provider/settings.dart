import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  bool _isDarkMode;
  bool get isDarkMode => _isDarkMode;

  final Map<String, dynamic> _ingredientList;
  Map<String, dynamic> get ingredientList => _ingredientList;

  SettingsProvider(this._isDarkMode, this._ingredientList);

  Future<void> setDarkMode(bool isDarkMode) async {
    _isDarkMode = isDarkMode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode);
    notifyListeners();
  }

  Future<void> setIngredientList(String key, bool value) async {
    _ingredientList[key] = value;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('ingredientList', jsonEncode(ingredientList));
    notifyListeners();
  }
}
