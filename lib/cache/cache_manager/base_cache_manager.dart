/// THIS IS A BASE CACHE MANAGEMENT CLASS THAT DEFINES ALL CACHE OPERATIONS.
abstract class BaseCacheManager<T> {
  ///SAVE METHOD FOR T TYPE DATA
  Future<void> saveData({required T data});

  ///GET METHOD FOR T TYPE DATA
  Future<T?> getData();

  ///CLEAR METHOD
  Future<void> clearData();
}
