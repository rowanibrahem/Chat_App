import 'package:chatapp_mentor/core/constants/asset_images.dart';
import 'package:chatapp_mentor/core/shared_widgets/custom_button.dart';
import 'package:chatapp_mentor/core/shared_widgets/dafault_text.dart';
import 'package:chatapp_mentor/core/themes/styles.dart';
import 'package:chatapp_mentor/features/auth/presentation/views/signup_view.dart';
import 'package:chatapp_mentor/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

bool isPasswordVisible = false;
bool? currentValue;

var formKey = GlobalKey<FormState>();

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    AssetImages.logo,
                    width: 300,
                    height: 250,
                  ),
                ),
                Text(
                  'Log in to your account',
                  style: Styles.textStyle24,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultText(
                  type: TextInputType.emailAddress,
                  controller: emailController,
                  label: 'enter your email',
                  hint: 'your email',
                  prefix: Icons.email,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Email must not be empty';
                    }
                    return null;
                  },
                  onChange: (value) {
                    print(value);
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                defaultText(
                  type: TextInputType.visiblePassword,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'password is too short';
                    }
                    return null;
                  },
                  controller: passwordController,
                  hint: 'Password',
                  label: 'enter your password',
                  prefix: Icons.lock,
                  suffix: isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  pressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  onChange: (value) {
                    print(value);
                  },
                  isObscure: !isPasswordVisible,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                 CustomButton(
                  text: 'Log In', 
                  func: (){
                  if (!emailController.text.contains('@')) {
                      displayToastMssg('Email address isn \' t valid', context);
                    } else if (passwordController.text.isEmpty) {
                      displayToastMssg('Password is mandatory', context);
                    } 
                    else {
                     Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                    builder: (context) => const HomeView(), 
                    ),
                    );
                    }
                  }
                  ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don \'t have an account ?',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpView(),
                          ),
                        );
                      },
                      child:  Text(
                        'Register here',
                        style: Styles.textStyle10,
                      ),
                    ),
                  ],
                ),
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
  SnackBar customSnackBar({required String message}) {
    return SnackBar(
      content: Container(
          alignment: Alignment.center,
          height: 40,
          child: Text(
            message,
            style: const TextStyle(fontSize: 16),
          )),
    );
  }
}
