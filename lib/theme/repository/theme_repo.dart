import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_summariser_yt/theme/theme_store.dart';

import '../../video_summary/models/SummaryDataModel.dart';

class ThemeRepo {
  static late Isar _isar;
  static Future<void> initialize() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      _isar = await Isar.open(
        [SummaryDataModelSchema, ThemeStoreSchema],
        directory: dir.path,
      );
    } else {
      _isar = Isar.getInstance()!;
    }
  }

  static Future<List<ThemeStore>> getThemes() async {
    final themes = _isar.themeStores.where().findAll();
    return themes;
  }

  static Future<void> addTheme(ThemeStore themeStore) async {
    await _isar.writeTxn(() async {
      await _isar.themeStores.put(themeStore);
    });
  }
}
