part of 'enter_video_details_bloc.dart';

@immutable
sealed class EnterVideoDetailsState {}

final class EnterVideoDetailsInitial extends EnterVideoDetailsState {}

sealed class EnterVideoDetailsActionState extends EnterVideoDetailsState {}

class ModelSelectedState extends EnterVideoDetailsState {
  final String selectedModel;

  ModelSelectedState({required this.selectedModel});
}

class FieldsNotFilledState extends EnterVideoDetailsState {}

class SliderSlideState extends EnterVideoDetailsState {
  final double newVal;

  SliderSlideState({required this.newVal});
}
