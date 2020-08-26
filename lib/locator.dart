import 'package:get_it/get_it.dart';
import './data/data.dart';
import './providers/providers.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  // Data services
  getIt.registerLazySingleton(() => AuthFireBase());
  getIt.registerLazySingleton(() => UsersFirebaseStorage());
  getIt.registerLazySingleton(() => SpacesFirebaseStorage());
  getIt.registerLazySingleton(() => KeywordsPrefStorage());

  // Providers
  getIt.registerLazySingleton(() => HistoryKeywords());
}
