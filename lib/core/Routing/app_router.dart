import 'package:chatapp_mentor/core/DI/dependency_injection.dart';
import 'package:chatapp_mentor/core/Routing/routes.dart';
import 'package:chatapp_mentor/features/auth/presentation/managers/auth_cubit/auth_cubit.dart';
import 'package:chatapp_mentor/features/auth/presentation/views/login_view.dart';
import 'package:chatapp_mentor/features/auth/presentation/views/signup_view.dart';
import 'package:chatapp_mentor/features/home/presentation/views/home_view.dart';
import 'package:chatapp_mentor/features/home/presentation/views/new_group_view.dart';
import 'package:chatapp_mentor/features/home/presentation/views/profile_view.dart';
import 'package:chatapp_mentor/features/home/presentation/views/widgets/home_body.dart';
import 'package:chatapp_mentor/features/home/presentation/views/widgets/new_group_second_step.dart';
import 'package:chatapp_mentor/features/splash_screen/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // this is the arguments that we can pass to the screen like  this Navigator.pushNamed(context, Routes.loginScreen, arguments: 'Hello');
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
            builder: (_) => const SplashView());
      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<AuthCubit>(),
                  child: const SignUpView(),
                ));
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<AuthCubit>(),
                  child: const LoginView(),
                ));
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => const HomeView());
      case Routes.chatScreen:
        return MaterialPageRoute(
            builder: (_) => const ChatView());
      case Routes.profileScreen:
        return MaterialPageRoute(
            builder: (_) => const ProfileView());
      case Routes.newGroupScreen:
        return MaterialPageRoute(
            builder: (_) => const NewGroupView());
      case Routes.newGroupSecondStepScreen:
        return MaterialPageRoute(
            builder: (_) => const NewGroupSecondStep());
      default:
        return MaterialPageRoute(
            builder: (_) =>
                const Scaffold(
                  body: Center(
                    child: Text('No route defined'),
                  ),
                ));
    }
  }
}
