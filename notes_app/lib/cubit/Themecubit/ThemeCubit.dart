import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themecubit extends Cubit<ThemeData> {
  Themecubit() : super(Themelight) {
    LoadSavedTheme();
  }

  static final Themelight = ThemeData.light();
  static final Themedark = ThemeData.dark();

  Future<void> LoadSavedTheme() async {
    final prefs = await SharedPreferences.getInstance();
    bool isdarkmode = prefs.getBool("theme") ?? false;
    emit(isdarkmode ? Themedark : Themelight);
  }

  void isdark(bool isdark) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("theme", isdark);
    emit(isdark ? Themedark : Themelight);
  }
}
