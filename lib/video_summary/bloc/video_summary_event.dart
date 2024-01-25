part of 'video_summary_bloc.dart';

sealed class VideoSummaryEvent {}

class SummaryFetchEvent extends VideoSummaryEvent {
  final String transcript;

  SummaryFetchEvent(this.transcript);
}

class GetTranscriptEvent extends VideoSummaryEvent {
  final String videoUrl;

  GetTranscriptEvent({required this.videoUrl});
}
