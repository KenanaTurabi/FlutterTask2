import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_new/TaskModel/taskModel.dart';

class TaskWidget extends StatelessWidget {
  TaskModel taskmodel;
  Function? function;
  TaskWidget(this.taskmodel, [this.function]); //function is obtional parameter

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: taskmodel
          .isComplete, //widget: to reach the variables from the stateful class
      onChanged: (v) {
        function!(taskmodel); //! not a trigger its for nullable
        //  setState(
        //    () {}); //the problem is that setstate()will make rebuild to the nearest build function
        //, so the rebuild will be on the level of widget only not on the level of the screen
        // when i move to the other screens the changes will occur ,  which iS NOT CORRECT I need quick change
        // the solution to change the complete and un complete into statefull(i dont need to change all tasks screen coz even there is achange the task will not disappear from all tasks)
        // another solution to make the change on task manager (coz it will affect all screen tabs)
      },
      title: Text(taskmodel.name),
    );
  }
}
