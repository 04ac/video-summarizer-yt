part of 'saved_summary_list_bloc.dart';

@immutable
abstract class SavedSummaryListEvent {}

class SavedSummaryListActionEvent extends SavedSummaryListEvent {}

class SavedSummaryListLoadEvent extends SavedSummaryListEvent {}

class SavedSummaryListDeleteEvent extends SavedSummaryListEvent {
  final Id id;

  SavedSummaryListDeleteEvent({required this.id});
}
