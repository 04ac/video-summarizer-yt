part of 'video_summary_bloc.dart';

sealed class VideoSummaryEvent {}

sealed class VideoSummaryActionEvent extends VideoSummaryEvent {}

class SummaryFetchEvent extends VideoSummaryEvent {
  final String transcript;
  final String videoUrl;
  final String selectedModel;
  final double partitionNum;

  SummaryFetchEvent({
    required this.transcript,
    required this.videoUrl,
    required this.selectedModel,
    required this.partitionNum,
  });
}

class GetTranscriptEvent extends VideoSummaryEvent {
  final String videoUrl;
  final String selectedModel;
  final double partitionNum;

  GetTranscriptEvent({
    required this.videoUrl,
    required this.selectedModel,
    required this.partitionNum,
  });
}

class SaveSummaryBtnClickedActionEvent extends VideoSummaryActionEvent {
  final SummaryDataModel summary;

  SaveSummaryBtnClickedActionEvent({required this.summary});
}
