import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LanguageEvent {
  const LanguageEvent();
}

class LoadLanguage extends LanguageEvent {
  const LoadLanguage();
}

class ChangeLanguage extends LanguageEvent {
  final String code;
  const ChangeLanguage(this.code);
}

class LanguageState {
  final String code;
  const LanguageState([this.code = 'en']);
  Locale get locale => Locale(code);
}

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState()) {
    on<LoadLanguage>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      emit(LanguageState(prefs.getString('language_code') ?? 'en'));
    });
    on<ChangeLanguage>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('language_code', event.code);
      emit(LanguageState(event.code));
    });
  }
}
