import 'package:flutter/cupertino.dart';
import 'package:flutter_application_new/data/dummyDate.dart';
import 'package:flutter_application_new/widget/taskWidget.dart';

import '../TaskModel/taskModel.dart';

class IncompleteScreen extends StatelessWidget {
  Function function;
  IncompleteScreen(this.function);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.where((element) => !element.isComplete).toList().length,
      itemBuilder: (context, index) {
        return TaskWidget(
            tasks.where((element) => !element.isComplete).toList()[index],
            function);
      },
    );
  }
}
