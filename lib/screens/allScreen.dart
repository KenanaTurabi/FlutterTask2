import 'package:flutter/cupertino.dart';
import 'package:flutter_application_new/data/dummyDate.dart';
import 'package:flutter_application_new/widget/taskWidget.dart';

import '../TaskModel/taskModel.dart';

class Allscreen extends StatefulWidget {
  @override
  State<Allscreen> createState() => _AllscreenState();
}

class _AllscreenState extends State<Allscreen> {
  void checkTask(TaskModel taskModel) {
    int index = tasks.indexOf(taskModel);
    tasks[index].isComplete = !tasks[index].isComplete;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskWidget(tasks[index], checkTask);
      },
    );
  }
}
