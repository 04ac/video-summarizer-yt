import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:isar/isar.dart';
import 'package:meta/meta.dart';
import 'package:video_summariser_yt/saved_summary_list/repository/saved_summary_list_repo.dart';

import '../../video_summary/models/SummaryDataModel.dart';

part 'saved_summary_list_event.dart';
part 'saved_summary_list_state.dart';

class SavedSummaryListBloc
    extends Bloc<SavedSummaryListEvent, SavedSummaryListState> {
  SavedSummaryListBloc() : super(SavedSummaryListInitial()) {
    on<SavedSummaryListLoadEvent>(savedSummaryListLoadEvent);
    on<SavedSummaryListDeleteEvent>(savedSummaryListDeleteEvent);
  }

  FutureOr<void> savedSummaryListLoadEvent(SavedSummaryListLoadEvent event,
      Emitter<SavedSummaryListState> emit) async {
    await SavedSummaryListRepo.initialize();
    final summaries = await SavedSummaryListRepo.getSavedSummaryList();
    if (summaries.isEmpty) {
      emit(SummariesFetchedErrorState());
    } else {
      emit(SummariesFetchedSuccessState(summaries: summaries));
    }
  }

  FutureOr<void> savedSummaryListDeleteEvent(SavedSummaryListDeleteEvent event,
      Emitter<SavedSummaryListState> emit) async {
    final summaries = await SavedSummaryListRepo.deleteSummary(event.id);
    if (summaries.isEmpty) {
      emit(SummariesFetchedErrorState());
    } else {
      emit(SummariesFetchedSuccessState(summaries: summaries));
    }
  }
}
