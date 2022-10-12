import 'package:flutter/cupertino.dart';
import 'package:flutter_application_new/TaskModel/taskModel.dart';
import 'package:flutter_application_new/data/dummyDate.dart';
import 'package:flutter_application_new/widget/taskWidget.dart';

class CompleteScreen extends StatelessWidget {
  Function function;
  CompleteScreen(this.function);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.where((element) => element.isComplete).length,
      itemBuilder: (context, index) {
        return TaskWidget(
            tasks.where((element) => element.isComplete).toList()[index],
            function);

        //ar refrence not checkTask()
        // i just sent the location of the func in memory
      },
    );
  }
}
