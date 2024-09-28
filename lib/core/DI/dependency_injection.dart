import 'package:chatapp_mentor/features/auth/data/repo/auth_repo.dart';
import 'package:chatapp_mentor/features/auth/presentation/managers/auth_cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(firebaseAuth: FirebaseAuth.instance),
  );
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(getIt()),
  );
}
