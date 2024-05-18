import 'package:flutter/material.dart';
import 'package:to_do_app/dialog_box.dart';
import 'package:to_do_app/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final _controller = TextEditingController();

  List todoList = [
    ["submit app", true],
    ["play cricket", false]
  ];

  // checkbox was tapped
  void checkboxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  // save new task
  void saveNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
    _controller.clear();
  }

  // delete function
  void deleteFunction(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  // edit function
  void editTask(int index) {
    _controller.text = todoList[index][0];
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: () {
            setState(() {
              todoList[index][0] = _controller.text;
              Navigator.of(context).pop();
            });
            _controller.clear();
          },
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text("TODO APP"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: todoList[index][0],
              taskCompleted: todoList[index][1],
              onChanged: (value) => checkboxChanged(value, index),
              deleteFunction: (BuildContext context) => deleteFunction(index),
              editFunction: (BuildContext context) => editTask(index),
            );
          }),
    );
  }
}
