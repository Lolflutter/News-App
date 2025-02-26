abstract class LocalDataSource {
  Future<Map<dynamic, dynamic>?> getData();
  Future<void> saveData(Map data);
}