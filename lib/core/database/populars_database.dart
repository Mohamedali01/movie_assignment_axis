import 'package:hive/hive.dart';
import 'package:movie_assignment_axis/features/home/data/model/popular_model.dart';

class PopularsHiveCache {
  static const String boxName = 'popularsBox';

  Future<void> savePopulars(List<PopularModel> populars) async {
    final box = await Hive.openBox<PopularModel>(boxName);
    await box.clear();
    await box.addAll(populars);
  }

  Future<List<PopularModel>> getPopulars() async {
    final box = await Hive.openBox<PopularModel>(boxName);
    return box.values.toList();
  }

  Future<bool> hasData() async {
    final box = await Hive.openBox<PopularModel>(boxName);
    return box.isNotEmpty;
  }
}
