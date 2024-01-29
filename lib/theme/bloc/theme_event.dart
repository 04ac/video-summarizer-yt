part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class ThemeChangedEvent extends ThemeEvent {}

class LoadThemeEvent extends ThemeEvent {}
