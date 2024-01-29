import 'package:isar/isar.dart';

part 'theme_store.g.dart';

@collection
class ThemeStore {
  Id id = Isar.autoIncrement;
  bool darkMode;
  ThemeStore({required this.darkMode});
}
