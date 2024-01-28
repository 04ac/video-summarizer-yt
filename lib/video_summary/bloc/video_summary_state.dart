part of 'video_summary_bloc.dart';

abstract class VideoSummaryState {}

class VideoSummaryActionState extends VideoSummaryState {}

class VideoSummaryInitial extends VideoSummaryState {}

class VideoSummaryLoadingState extends VideoSummaryState {}

class VideoSummarySuccessState extends VideoSummaryState {
  final SummaryDataModel summary;

  VideoSummarySuccessState({required this.summary});
}

class VideoSummaryErrorState extends VideoSummaryState {
  final String message;

  VideoSummaryErrorState({required this.message});
}

class GetTranscriptLoadingState extends VideoSummaryState {}

class GetTranscriptSuccessState extends VideoSummaryState {
  final String transcript;
  final String videoUrl;
  final String selectedModel;

  GetTranscriptSuccessState(
      {required this.transcript,
      required this.videoUrl,
      required this.selectedModel});
}

class SummarySavedSuccessState extends VideoSummaryActionState {}

class SummarySaveErrorState extends VideoSummaryActionState {}
