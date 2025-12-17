abstract class DatabaseService {
  Future<void> addData({
    required String path,
    Map<String, dynamic>? data,
    String? documnentId,
  });
  Future<Map<String, dynamic>> getData({
    required String path,
    required String doucmentId,
  });
  Future<bool> isUserExist({required String path, required String doucmentId});
}
