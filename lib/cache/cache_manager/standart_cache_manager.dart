import 'package:cache_security/cache/cache_manager/base_cache_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// IT IS A STANDART CACHE MANAGEMENT CLASS THAT DOES NOT PERFORM ENCRYPTION.IT EXTENDS BaseCacheManager<T>,
class StandartCacheManager<T> extends BaseCacheManager<T> {
  final String boxName;
  final String keyName;

  StandartCacheManager({
    required this.boxName,
    required this.keyName,
  });

  Future<Box<T>> _openBox() async {
    return Hive.openBox<T>(boxName);
  }

  ///SAVE
  @override
  Future<void> saveData({required T data, bool encrypt = false}) async {
    final box = await _openBox();
    await box.put(keyName, data);
    await box.close();
  }

  ///GET
  @override
  Future<T?> getData({bool decrypt = false}) async {
    final box = await _openBox();
    final data = box.get(keyName);
    await box.close();
    return data;
  }

  ///CLEAR
  @override
  Future<void> clearData() async {
    final box = await _openBox();
    await box.delete(keyName);
    await box.close();
  }
}
