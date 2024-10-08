import 'package:chatapp_mentor/features/auth/data/repo/auth_repo.dart';
import 'package:chatapp_mentor/features/auth/presentation/managers/auth_cubit/auth_cubit.dart';
import 'package:chatapp_mentor/features/home/data/repo/chat_repo.dart';
import 'package:chatapp_mentor/features/home/presentation/manager/cubit/chat_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  await Firebase.initializeApp();

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(firebaseAuth: FirebaseAuth.instance),
  );

  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<ChatRepository>(
    () => ChatRepository(),
  );

  getIt.registerFactory<ChatCubit>(
    () => ChatCubit(getIt<ChatRepository>()),
  );
}
