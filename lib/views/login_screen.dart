import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mynews/views/widgets/custom_appbar.dart';
import 'package:mynews/views/widgets/custom_button.dart';
import 'package:mynews/views/widgets/custom_login_signup_widget.dart';
import 'package:mynews/views/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

import '../providers/provider.dart';
import '../utils/themes.dart';
import 'widgets/custom_snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormState> formkey;
  late UserProvider provider;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  @override
  void initState() {
    provider = context.read<UserProvider>();
    formkey = GlobalKey<FormState>();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                            label: 'Email', controller: usernameController),
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
                          label: 'Login',
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              provider.login(
                                usernameController.text,
                                passwordController.text,
                           context,
                              );
                            }
                          },
                        ),
                        customLoginSignupWidget(context),
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
