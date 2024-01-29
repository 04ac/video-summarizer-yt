import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_summariser_yt/theme/theme_store.dart';
import 'package:video_summariser_yt/video_summary/models/SummaryDataModel.dart';

import '../repository/summary_repo.dart';

part 'video_summary_event.dart';
part 'video_summary_state.dart';

class VideoSummaryBloc extends Bloc<VideoSummaryEvent, VideoSummaryState> {
  VideoSummaryBloc() : super(VideoSummaryInitial()) {
    on<SummaryFetchEvent>(summaryFetchEvent);
    on<GetTranscriptEvent>(getTranscriptEvent);
    on<SaveSummaryBtnClickedActionEvent>(saveSummaryBtnClickedActionEvent);
  }

  bool clicked = false;

// facebook/bart-large-cnn
// sshleifer/distilbart-cnn-12-6
  FutureOr<void> summaryFetchEvent(
      SummaryFetchEvent event, Emitter<VideoSummaryState> emit) async {
    emit(VideoSummaryLoadingState());
    String summary = "";
    try {
      summary = await SummaryRepo.getSummaryMultiplePortions(
          "https://api-inference.huggingface.co/models/${event.selectedModel}",
          event.transcript,
          event.partitionNum);
    } catch (e) {
      emit(VideoSummaryErrorState(
          message:
              "Oops! An error occurred\nSummary not generated. Please try again after some time."));
      return;
    }
    emit(
      VideoSummarySuccessState(
        summary: SummaryDataModel(
          summaryText: summary,
          videoUrl: event.videoUrl,
          selectedModel: event.selectedModel,
        ),
      ),
    );
  }

  FutureOr<void> getTranscriptEvent(
      GetTranscriptEvent event, Emitter<VideoSummaryState> emit) async {
    emit(GetTranscriptLoadingState());
    String transcript = "";
    try {
      transcript = await SummaryRepo.getTranscript(event.videoUrl);
    } catch (e) {
      emit(VideoSummaryErrorState(
          message:
              "Oops! An error occurred\nPlease enter a valid URL\n(video must contain subtitles)"));
      return;
    }
    // Regex to remove non-printable characters
    add(SummaryFetchEvent(
      transcript: transcript.replaceAll(RegExp(r'[^ -~\t\n\r]'), ''),
      videoUrl: event.videoUrl,
      selectedModel: event.selectedModel,
      partitionNum: event.partitionNum,
    ));
  }

  FutureOr<void> saveSummaryBtnClickedActionEvent(
      SaveSummaryBtnClickedActionEvent event,
      Emitter<VideoSummaryState> emit) async {
    Isar? isar;
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      isar = await Isar.open(
        [SummaryDataModelSchema, ThemeStoreSchema],
        directory: dir.path,
      );
    } else {
      isar = Isar.getInstance();
    }

    if (isar == null) {
      emit(SummarySaveErrorState());
    } else {
      final summaries = isar.summaryDataModels;
      await isar.writeTxn(() async {
        await summaries.put(event.summary);
      });
      emit(SummarySavedSuccessState());
    }
  }
}
