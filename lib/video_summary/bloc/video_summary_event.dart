part of 'video_summary_bloc.dart';

sealed class VideoSummaryEvent {}

class SummaryFetchEvent extends VideoSummaryEvent {
  final String transcript;
  final String videoUrl;
  final String selectedModel;

  SummaryFetchEvent(
      {required this.transcript,
      required this.videoUrl,
      required this.selectedModel});
}

class GetTranscriptEvent extends VideoSummaryEvent {
  final String videoUrl;
  final String selectedModel;

  GetTranscriptEvent({required this.videoUrl, required this.selectedModel});
}
