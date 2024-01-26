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
