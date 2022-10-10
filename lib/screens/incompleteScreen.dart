import 'package:flutter/cupertino.dart';
import 'package:flutter_application_new/data/dummyDate.dart';
import 'package:flutter_application_new/widget/taskWidget.dart';

import '../TaskModel/taskModel.dart';

class IncompleteScreen extends StatefulWidget {
  @override
  State<IncompleteScreen> createState() => _IncompleteScreenState();
}

class _IncompleteScreenState extends State<IncompleteScreen> {
  void checkTask(TaskModel taskModel) {
    int index = tasks.indexOf(taskModel);
    tasks[index].isComplete = !tasks[index].isComplete;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.where((element) => !element.isComplete).toList().length,
      itemBuilder: (context, index) {
        return TaskWidget(
            tasks.where((element) => !element.isComplete).toList()[index],
            checkTask);
      },
    );
  }
}
