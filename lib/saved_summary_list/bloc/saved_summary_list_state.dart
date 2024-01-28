part of 'saved_summary_list_bloc.dart';

@immutable
abstract class SavedSummaryListState {}

abstract class SavedSummaryListActionState {}

class SavedSummaryListInitial extends SavedSummaryListState {}

class SummariesFetchedSuccessState extends SavedSummaryListState {
  final List<SummaryDataModel> summaries;

  SummariesFetchedSuccessState({required this.summaries});
}

class SummariesFetchedErrorState extends SavedSummaryListState {}
