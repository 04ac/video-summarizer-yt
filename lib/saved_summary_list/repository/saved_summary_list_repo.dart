import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../video_summary/models/SummaryDataModel.dart';

class SavedSummaryListRepo {
  static late Isar _isar;
  static Future<void> initialize() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      _isar = await Isar.open(
        [SummaryDataModelSchema],
        directory: dir.path,
      );
    } else {
      _isar = Isar.getInstance()!;
    }
  }

  static Future<List<SummaryDataModel>> getSavedSummaryList() async {
    final summaries = _isar.summaryDataModels.where().findAll();
    return summaries;
  }

  static Future<List<SummaryDataModel>> deleteSummary(Id id) async {
    await _isar.writeTxn(() async {
      await _isar.summaryDataModels.delete(id);
    });
    final summaries = _isar.summaryDataModels.where().findAll();
    return summaries;
  }
}
