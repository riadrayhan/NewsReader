

import 'package:flutter/material.dart';

import 'all_news.dart';
import 'breaking_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("News Reader"),
          centerTitle: true,
          bottom: TabBar(tabs: const [
            Tab(child: Text("Breaking News"),),
            Tab(child: Text("All News"),),
          ]),
        ),
        body: TabBarView(
          children: const [
            BreakingNews(),
            AllNews(),
          ],
        ),
      ),
    );
  }
}