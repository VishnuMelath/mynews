import 'package:flutter/material.dart';
import 'package:mynews/utils/themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: SafeArea(child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Text('MyNews',style: TextStyle(color: blue,fontWeight: FontWeight.w900,fontSize: 15),),
        ),
      )),
    );
  }
}