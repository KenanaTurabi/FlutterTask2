import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_new/screens/allScreen.dart';
import 'package:flutter_application_new/screens/completeScreen.dart';
import 'package:flutter_application_new/screens/incompleteScreen.dart';

class MainTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Task Management'),
            bottom: TabBar(tabs: [
              Tab(text: 'All Tasks'),
              Tab(text: 'complete Tasks'),
              Tab(text: 'Incomplete Tasks'),
            ]),
          ),
          body: TabBarView(
            children: [
              Allscreen(),
              CompleteScreen(),
              IncompleteScreen(),
            ],
          )),
    );
  }
}
