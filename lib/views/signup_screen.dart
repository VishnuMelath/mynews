import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mynews/models/user_model.dart';
import 'package:mynews/providers/provider.dart';
import 'package:provider/provider.dart';

import '../utils/themes.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_login_signup_widget.dart';
import 'widgets/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late UserProvider provider;
  late GlobalKey<FormState> formkey;
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    formkey = GlobalKey<FormState>();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider = context.read<UserProvider>();
    return ColoredBox(
      color: backgroundColor!,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: customAppBar(),
        body: Form(
          key: formkey,
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        customTextField(
                            label: 'Name', controller: usernameController),
                        customTextField(
                            label: 'Email', controller: emailController),
                        customTextField(
                          controller: passwordController,
                          label: 'Password',
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        customButton(
                          context,
                          label: 'Signup',
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              log('message');
                              provider.signUp(
                                UserModel(
                                    name: usernameController.text,
                                    email: emailController.text),
                                passwordController.text,
                                context,
                              );
                            }
                          },
                        ),
                        customLoginSignupWidget(context, login: false),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
