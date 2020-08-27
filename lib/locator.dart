import 'package:get_it/get_it.dart';
import './data/data.dart';
import './providers/providers.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  // Data services
  getIt.registerLazySingleton(() => AuthFireBase());
  getIt.registerLazySingleton(() => UsersFireStore());
  getIt.registerLazySingleton(() => SpacesFireStorage());
  getIt.registerLazySingleton(() => KeywordsPrefStorage());
  getIt.registerLazySingleton(() => MessagesFireStore());
}
