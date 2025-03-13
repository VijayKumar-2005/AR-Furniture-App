import 'package:hive_flutter/hive_flutter.dart';

class DataBaseHandler {
  static final DataBaseHandler instance = DataBaseHandler._internal();
  Box? box;

  DataBaseHandler._internal();

  Future<void> init(String boxName) async {
    await Hive.initFlutter();
    box = await Hive.openBox(boxName);
  }

  Future<void> putData(String key, dynamic value) async {
    await box!.put(key, value);
  }

  dynamic getData(String key) {
    return box!.get(key);
  }

  Future<void> deleteData(String key) async {
    await box!.delete(key);
  }
}
