// import 'dart:developer';

// import 'package:chatapp_mentor/features/auth/data/repo/auth_repo.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'auth_state.dart';

// late String currentEmail;
// class AuthCubit extends Cubit<AuthState> {
//   final AuthRepository _authRepository;
//   AuthCubit(this._authRepository) : super(AuthInitialState());

//   Future<void> registerUser({
//     required String email,
//     required String password,
//     required String name,
//     required String phone,
//   }) async {
//     emit(RegisterLoadingState());
//     try {
//       UserCredential userCredential = await _authRepository.registerUser(
//         email: email,
//         password: password,
//       );

//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userCredential.user!.uid)
//           .set({
//         'name': name,
//         'phone': phone,
//         'email': email,
//       });
//       await getCurrentUserData();
//       emit(RegisterSuccessState());
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         emit(RegisterFailureState(
//             errorMessage: 'The password provided is too weak.'));
//       } else if (e.code == 'email-already-in-use') {
//         emit(RegisterFailureState(
//             errorMessage: 'The account already exists for that email.'));
//       }
//     } on Exception catch (e) {
//       emit(RegisterFailureState(errorMessage: 'Something went wrong: $e'));
//     }
//   }

//   Future<void> logIn({required String email, required String password}) async {
//     emit(LoginLoadingState());
//     try {
//       await _authRepository.loginUser(email: email, password: password);
//       await getCurrentUserData();
//       emit(LoginSuccessState());
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         emit(LoginFailureState(errorMessage: 'user-not-found'));
//       } else if (e.code == 'wrong-password') {
//         emit(LoginFailureState(errorMessage: 'wrong-password'));
//       } else if (e.code == 'invalid-email') {
//         emit(LoginFailureState(errorMessage: 'invalid-email'));
//       } else if (e.code == 'user-disabled') {
//         emit(LoginFailureState(errorMessage: 'user-disabled'));
//       } else if (e.code == 'too-many-requests') {
//         emit(LoginFailureState(errorMessage: 'too-many-requests'));
//       } else {
//         emit(LoginFailureState(errorMessage: 'Something went wrong.'));
//       }
//     } on Exception catch (e) {
//       emit(LoginFailureState(errorMessage: 'Something went wrong: $e'));
//     }

//     @override
//     void onChange(Change<AuthState> change) {
//       super.onChange(change);
//       log('Change: $change');
//     }
//   }

//   Future<void> getCurrentUserData() async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       final userData = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(user.uid)
//           .get();
//       currentEmail = user.email??'No Email';
//       log(user.email.toString());
//       log(userData.data().toString());
//     }
//   }
// }
