import 'package:chatapp_mentor/core/Routing/routes.dart';
import 'package:chatapp_mentor/core/constants/asset_images.dart';
import 'package:chatapp_mentor/core/shared_widgets/custom_button.dart';
import 'package:chatapp_mentor/core/shared_widgets/dafault_text.dart';
import 'package:chatapp_mentor/core/themes/styles.dart';
import 'package:chatapp_mentor/features/auth/presentation/managers/auth_cubit/auth_cubit.dart';
import 'package:chatapp_mentor/features/auth/presentation/managers/auth_cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          Navigator.pushReplacementNamed(
            context,
            Routes.homeScreen,
          );
        } else if (state is RegisterFailureState) {
          displayToastMssg(state.errorMessage ?? 'error occured', context);
        }
      },
      builder: (context, state) {
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
                    Text(
                      'Register To New Account',
                      style: Styles.textStyle24,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 15.0),
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
                    const SizedBox(height: 15.0),
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
                    const SizedBox(height: 15.0),
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
                    const SizedBox(height: 20.0),
                    if (state is RegisterLoadingState)
                      const CircularProgressIndicator()
                    else
                      CustomButton(
                        text: 'Sign Up',
                        func: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthCubit>().registerUser(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                );
                          }
                        },
                      ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              Routes.loginScreen,
                            );
                          },
                          child: const Text('Login here'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  displayToastMssg(String msg, BuildContext context) {
    Fluttertoast.showToast(msg: msg);
  }
}
