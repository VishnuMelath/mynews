import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mynews/providers/provider.dart';
import 'package:mynews/utils/fontstyles.dart';
import 'package:mynews/utils/themes.dart';
import 'package:mynews/views/widgets/newstile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserProvider provider;
  @override
  void initState() {
    provider = context.read<UserProvider>();
    provider.getAllNews(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: blue,
      child: SafeArea(
          child: RefreshIndicator(
        onRefresh: () async {
          await provider.getAllNews(context);
        },
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: blue,
            title: const Text('MyNews', style: whiteTextStyle),
            actions: [
              const RotatedBox(
                quarterTurns: 3,
                child: Icon(
                  Icons.send,
                  color: white,
                  size: 14,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  provider.country_code,
                  style: whiteTextStyle,
                ),
              ),
              const SizedBox(
                width: 15,
              )
            ],
          ),
          body: context.watch<UserProvider>().isloading
              ? Center(
                  child: CircularProgressIndicator(
                    color: blue,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 10, bottom: 5),
                      child: Text(
                        'Top Headlines',
                        style: blackBoldTextStyle,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: provider.news.length,
                        itemBuilder: (context, index) =>
                            Newstile(newsmodel: provider.news[index]),
                      ),
                    ),
                  ],
                ),
        ),
      )),
    );
  }
}
