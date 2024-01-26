import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:video_summariser_yt/video_summary/models/SummaryDataModel.dart';

import '../repository/summary_repo.dart';

part 'video_summary_event.dart';
part 'video_summary_state.dart';

class VideoSummaryBloc extends Bloc<VideoSummaryEvent, VideoSummaryState> {
  VideoSummaryBloc() : super(VideoSummaryInitial()) {
    on<SummaryFetchEvent>(summaryFetchEvent);
    on<GetTranscriptEvent>(getTranscriptEvent);
  }

// facebook/bart-large-cnn
// sshleifer/distilbart-cnn-12-6
  FutureOr<void> summaryFetchEvent(
      SummaryFetchEvent event, Emitter<VideoSummaryState> emit) async {
    emit(VideoSummaryLoadingState());
    String summary = await SummaryRepo.getSummaryMultiplePortions(
        "https://api-inference.huggingface.co/models/${event.selectedModel}",
        event.transcript,
        event.partitionNum);
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
      emit(VideoSummaryErrorState());
    }
    // Regex to remove non-printable characters
    add(SummaryFetchEvent(
      transcript: transcript.replaceAll(RegExp(r'[^ -~\t\n\r]'), ''),
      videoUrl: event.videoUrl,
      selectedModel: event.selectedModel,
      partitionNum: event.partitionNum,
    ));
  }
}
