import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late GlobalKey<FormState> formkey;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  @override
  void initState() {
    formkey = GlobalKey<FormState>();
    usernameController=TextEditingController();
    passwordController =TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}