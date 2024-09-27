import 'package:flutter/material.dart';
import 'package:mynews/utils/animated_routing.dart';
import 'package:mynews/utils/themes.dart';
import 'package:mynews/views/login_screen.dart';
import 'package:mynews/views/signup_screen.dart';

Widget customLoginSignupWidget(BuildContext context,{bool login = true}) {
  return Padding(
    padding: const EdgeInsets.only(top:8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(login ? 'New here?' : 'Already have an account?',style: const TextStyle(
          fontSize: 13,
          letterSpacing: 0
        ),),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context, customRoute(login?const SignupScreen():const LoginScreen(),));
          },
          child: Text(login ? 'Signup' : 'Login',style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: blue),),
        )
      ],
    ),
  );
}
