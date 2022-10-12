import 'package:flutter/cupertino.dart';
import 'package:flutter_application_new/data/dummyDate.dart';
import 'package:flutter_application_new/widget/taskWidget.dart';

import '../TaskModel/taskModel.dart';

class Allscreen extends StatelessWidget {
  Function function;
  Allscreen(this.function);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskWidget(tasks[index], function);
      },
    );
  }
}
