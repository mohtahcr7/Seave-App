// Create a global instance (or use GetIt.instance)
import 'package:get_it/get_it.dart';
import 'package:seave/core/services/database_service.dart';
import 'package:seave/core/services/firebase_auth_service.dart';
import 'package:seave/core/services/firestore_service.dart';
import 'package:seave/featuer/auth/domin/repos/auth_repo.dart';
import 'package:seave/featuer/auth/domin/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;

// 2. Register them at app startup
void setupGetIt() {
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      fireStoreService: FireStoreService(),
    ),
  );
}
