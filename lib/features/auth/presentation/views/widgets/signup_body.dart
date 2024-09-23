import 'package:chatapp_mentor/core/constants/asset_images.dart';
import 'package:chatapp_mentor/core/shared_widgets/custom_button.dart';
import 'package:chatapp_mentor/core/shared_widgets/dafault_text.dart';
import 'package:chatapp_mentor/core/themes/styles.dart';
import 'package:chatapp_mentor/features/auth/presentation/views/login_view.dart';
import 'package:chatapp_mentor/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();

bool isPasswordVisible = false;
bool? currentValue;

var formKey = GlobalKey<FormState>();

class _SignupBodyState extends State<SignupBody> {
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
                    width: 200,
                    height: 200,
                  ),
                ),
                // SizedBox(height: 1,),
                Text(
                  'Register To New Account',
                  style: Styles.textStyle24,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultText(
                  type: TextInputType.text,
                  controller: nameController,
                  label: 'enter your name',
                  hint: 'your name',
                  prefix: Icons.person,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'name must not be empty';
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
                  type: TextInputType.phone,
                  controller: phoneController,
                  label: 'enter your phone',
                  hint: 'your phone',
                  prefix: Icons.phone_android_rounded,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'phone must not be empty';
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
                  text: 'Sign Up', 
                  func: (){
                  if (nameController.text.length < 5) {
                      displayToastMssg(
                          'name must be at least 4 characters', context);
                    } else if (!emailController.text.contains('@')) {
                      displayToastMssg('Email address isn \' t valid', context);
                    } else if (phoneController.text.isEmpty) {
                      displayToastMssg('Phone number is mandatory', context);
                    } else if (passwordController.text.length < 8) {
                      displayToastMssg(
                          'Password must be at least 8 characters', context);
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
                      'Already have an account ?',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ),
                        );
                      },
                      child: const Text(
                        'Login here',
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
