import 'package:isar/isar.dart';

part 'SummaryDataModel.g.dart';

@collection
class SummaryDataModel {
  Id id = Isar.autoIncrement;
  final String summaryText;
  final String videoUrl;
  final String selectedModel;
  SummaryDataModel({
    required this.summaryText,
    required this.videoUrl,
    required this.selectedModel,
  });
}
