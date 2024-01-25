part of 'video_summary_bloc.dart';

abstract class VideoSummaryState {}

class VideoSummaryActionState extends VideoSummaryState {}

class VideoSummaryInitial extends VideoSummaryState {}

class VideoSummaryLoadingState extends VideoSummaryState {}

class VideoSummarySuccessState extends VideoSummaryState {
  final String summary;

  VideoSummarySuccessState({required this.summary});
}

class VideoSummaryErrorState extends VideoSummaryState {}

class GetTranscriptLoadingState extends VideoSummaryState {}

class GetTranscriptSuccessState extends VideoSummaryState {
  final String transcript;

  GetTranscriptSuccessState({required this.transcript});
}
