
import 'package:chatapp_mentor/features/auth/presentation/views/widgets/email_field.dart';
import 'package:chatapp_mentor/features/auth/presentation/views/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:chatapp_mentor/features/auth/presentation/views/widgets/login_button.dart';
import 'package:chatapp_mentor/features/auth/presentation/views/widgets/login_title.dart';
import 'package:chatapp_mentor/features/auth/presentation/views/widgets/logo.dart';
import 'package:chatapp_mentor/features/auth/presentation/views/widgets/register_row.dart';
import 'package:chatapp_mentor/features/home/presentation/views/home_view.dart';



class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

bool isPasswordVisible = false;
var formKey = GlobalKey<FormState>();

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
   return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoWidget(),
                const SizedBox(height: 20),
                const LoginTitle(),
                const SizedBox(height: 20),
                EmailField(emailController: emailController),
                const SizedBox(height: 15),
                PasswordField(
                  passwordController: passwordController,
                  isPasswordVisible: isPasswordVisible,
                  toggleVisibility: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
                const SizedBox(height: 20),
                LoginButton(
                  emailController: emailController,
                  passwordController: passwordController,
                  onSuccess: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                const RegisterRow(),
              ],

            ),
          ),
        ),
      ),
   );
  }


  displayToastMssg(String msg, BuildContext context) {
    Fluttertoast.showToast(msg: msg);
  } 
}