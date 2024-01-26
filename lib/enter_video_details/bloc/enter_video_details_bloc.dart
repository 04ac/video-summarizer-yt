import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'enter_video_details_event.dart';
part 'enter_video_details_state.dart';

class EnterVideoDetailsBloc
    extends Bloc<EnterVideoDetailsEvent, EnterVideoDetailsState> {
  String dropdownValue = "Please choose a model";
  double sliderValue = -1500.0;
  EnterVideoDetailsBloc() : super(EnterVideoDetailsInitial()) {
    on<ModelDropdownChangeEvent>(modelDropdownChangeEvent);
    on<FieldsNotFilledErrorEvent>(fieldsNotFilledErrorEvent);
    on<SliderSlideEvent>(sliderSlideEvent);
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

  FutureOr<void> sliderSlideEvent(
      SliderSlideEvent event, Emitter<EnterVideoDetailsState> emit) {
    sliderValue = event.newVal;
    emit(SliderSlideState(newVal: event.newVal));
  }
}
