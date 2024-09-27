import 'package:flutter/material.dart';
import 'package:mynews/utils/themes.dart';
import 'package:provider/provider.dart';

import '../providers/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   late UserProvider provider;
  @override
  void initState() {
    provider = context.read<UserProvider>();
    provider.splashLoading(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: blue,
      child:  SafeArea(
          child: Scaffold(
            backgroundColor:blue,
            body: const Center(
                child: Text(
                    'MyNews',
                    style: TextStyle(color: white, fontSize: 25),
                  )),
          )),
    );
  }
}
