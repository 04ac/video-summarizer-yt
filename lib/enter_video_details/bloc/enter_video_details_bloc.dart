import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'enter_video_details_event.dart';
part 'enter_video_details_state.dart';

class EnterVideoDetailsBloc
    extends Bloc<EnterVideoDetailsEvent, EnterVideoDetailsState> {
  String dropdownValue = "";
  EnterVideoDetailsBloc() : super(EnterVideoDetailsInitial()) {
    on<ModelDropdownChangeEvent>(modelDropdownChangeEvent);
    on<FieldsNotFilledErrorEvent>(fieldsNotFilledErrorEvent);
  }

  FutureOr<void> modelDropdownChangeEvent(
      ModelDropdownChangeEvent event, Emitter<EnterVideoDetailsState> emit) {
    dropdownValue = event.newVal;
    emit(ModelSelectedState(selectedModel: event.newVal));
  }

  FutureOr<void> fieldsNotFilledErrorEvent(
      FieldsNotFilledErrorEvent event, Emitter<EnterVideoDetailsState> emit) {
    emit(FieldsNotFilledState());
  }
}
