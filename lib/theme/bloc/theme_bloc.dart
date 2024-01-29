import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../repository/theme_repo.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc({required this.theme}) : super(ThemeInitial()) {
    on<ThemeChangedEvent>(themeChangedEvent);
    on<LoadThemeEvent>(loadThemeEvent);
  }

  ThemeData theme;

  FutureOr<void> themeChangedEvent(
      ThemeChangedEvent event, Emitter<ThemeState> emit) async {
    theme = (theme == ThemeData.dark() ? ThemeData.light() : ThemeData.dark());
    final themes = await ThemeRepo.getThemes();
    themes[0].darkMode = (theme == ThemeData.dark());
    ThemeRepo.addTheme(themes[0]);
    emit(ThemeLoadedState());
  }

  FutureOr<void> loadThemeEvent(
      LoadThemeEvent event, Emitter<ThemeState> emit) async {
    emit(ThemeLoadedState());
  }
}
