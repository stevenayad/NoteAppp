import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Langcubit extends Cubit<Locale> {
  Langcubit() : super(const Locale('en')) {
    loadSavedLocale();
  }

  String arbic = 'ar';
  String english = 'en';

  Future<void> loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLocale = prefs.getString('locale') ?? 'en';
    emit(Locale(savedLocale));
  }

  Future<void> ischange(String locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("locale", locale);
    emit(Locale(locale));
  }
}
