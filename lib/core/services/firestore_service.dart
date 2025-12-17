import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seave/core/services/database_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    Map<String, dynamic>? data,
    String? documnentId,
  }) async {
    if (documnentId != null) {
      await firestore.collection(path).doc(documnentId).set(data!);
    } else {
      await firestore.collection(path).add(data!);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String doucmentId,
  }) async {
    var data = await firestore.collection(path).doc(doucmentId).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> isUserExist({
    required String path,
    required String doucmentId,
  }) async {
    var userData = await firestore.collection(path).doc(doucmentId).get();
    return userData.exists;
  }
}
