import 'package:flutter/material.dart';
import 'package:mynews/utils/themes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: blue,
      child: const SafeArea(
          child: Center(
              child: Text(
        'MyNews',
        style: TextStyle(color: white, fontSize: 25),
      ))),
    );
  }
}
