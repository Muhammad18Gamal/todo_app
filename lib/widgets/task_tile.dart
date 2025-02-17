import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  final String taskTitle;
  final bool initialIsChecked;
  final void Function(bool?) checkboxChange;

  const TaskTile({
    super.key,
    required this.taskTitle,
    required this.initialIsChecked,
    required this.checkboxChange,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool? isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialIsChecked;
  }

  void toggleCheckboxState(bool? checkboxState) {
    setState(() {
      isChecked = checkboxState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.taskTitle,
        style: TextStyle(
          decoration: isChecked! ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.orange,
        value: isChecked,
        onChanged: toggleCheckboxState,
      ),
    );
  }
}
