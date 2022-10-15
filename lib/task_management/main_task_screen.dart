import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_new/screens/allScreen.dart';
import 'package:flutter_application_new/screens/completeScreen.dart';
import 'package:flutter_application_new/screens/incompleteScreen.dart';

import '../TaskModel/taskModel.dart';
import '../data/dummyDate.dart';

class MainTaskScreen extends StatefulWidget {
  @override
  State<MainTaskScreen> createState() => _MainTaskScreenState();
}

class _MainTaskScreenState extends State<MainTaskScreen>
    with SingleTickerProviderStateMixin {
  //we can't use 2 extends also we will not use implements coz we wont make override to any method
  //so we have to use with which differnce from extends that the relation not inheitence its like frindship

  void checkTask(TaskModel taskModel) {
    int index = tasks.indexOf(taskModel);
    tasks[index].isComplete = !tasks[index].isComplete;
    setState(() {});
  }

  late TabController tabController;
  //i made the initialize inide method coz we cant use (this) keyword  in the class except inside a method
  initalizeTabController() {
    tabController = TabController(
        length: 3, vsync: this); //tabController explect needs statefull class
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initalizeTabController();
  }

  @override
  void dispose() {
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Scaffold(
            drawer: Drawer(
              child: Column(children: [
                /*
            Container(
              child: Image.asset('images/img5.jpg', fit: BoxFit.cover),
              color: Colors.blue,
              height: 200,
              width: 600,
            ),
            */
                UserAccountsDrawerHeader(
                  accountName: Text('Kenana Turabi'),
                  accountEmail: Text('kenanaturabi@gmail.com'),
                  currentAccountPicture: CircleAvatar(child: Text('K')),
                ),
                ListTile(
                  onTap: () {
                    tabController.animateTo(0);
                  },
                  title: Text('All Tasks'),
                  subtitle: Text("go to All Tasks Tab"),
                  leading: Icon(Icons.list),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  title: Text('Complete Tasks'),
                  subtitle: Text('Go to complete tasks Tab'),
                  leading: Icon(Icons.done),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    tabController.animateTo(1);
                  },
                ),
                ListTile(
                    title: Text('Incomplete Tasks'),
                    subtitle: Text('Go to Incomplete tasks Tab'),
                    leading: Icon(Icons.cancel),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      tabController.animateTo(2);
                    }),
              ]),
            ),
            appBar: AppBar(
              title: Text('Task Management'),
              bottom: TabBar(controller: tabController, tabs: [
                Tab(text: 'All Tasks'),
                Tab(text: 'complete Tasks'),
                Tab(text: 'Incomplete Tasks'),
              ]),
            ),
            body: Container(
              child: TabBarView(
                controller: tabController,
                children: [
                  Allscreen(checkTask),
                  CompleteScreen(checkTask),
                  IncompleteScreen(checkTask),
                ],
              ),
            ))
        : Scaffold(
            appBar: AppBar(
              title: Text('Task Management'),
              bottom: TabBar(controller: tabController, tabs: [
                Tab(text: 'All Tasks'),
                Tab(text: 'complete Tasks'),
                Tab(text: 'Incomplete Tasks'),
              ]),
            ),
            body: Row(
              children: [
                Expanded(
                  child: Column(children: [
                    ListTile(
                      onTap: () {
                        tabController.animateTo(0);
                      },
                      title: Text('All Tasks'),
                      subtitle: Text("go to All Tasks Tab"),
                      leading: Icon(Icons.list),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      title: Text('Complete Tasks'),
                      subtitle: Text('Go to complete tasks Tab'),
                      leading: Icon(Icons.done),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        tabController.animateTo(1);
                      },
                    ),
                    ListTile(
                        title: Text('Incomplete Tasks'),
                        subtitle: Text('Go to Incomplete tasks Tab'),
                        leading: Icon(Icons.cancel),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          tabController.animateTo(2);
                        }),
                  ]),
                ),
                Expanded(
                    child: Container(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Allscreen(checkTask),
                      CompleteScreen(checkTask),
                      IncompleteScreen(checkTask),
                    ],
                  ),
                ))
              ],
            ));
  }
}
