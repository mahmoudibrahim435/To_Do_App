// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:deleteme/widgets/counter.dart';
import 'package:deleteme/widgets/todo-card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class Task {
  String title;
  bool status;
  Task({
    required this.title,
    required this.status,
  });
}

class _TodoAppState extends State<TodoApp> {
  List allTasks = [
    Task(title: "Welcome!", status:false ),
    
  ];

  delete(int clickdelete) {
    setState(() {
      allTasks.remove(allTasks[clickdelete]);
    });
  }

  deleteall() {
setState(() {
      allTasks.removeRange(0, allTasks.length);
});
  }

  changeStatus(int taskIndex) {
    setState(() {
      allTasks[taskIndex].status = !allTasks[taskIndex].status;
    });
  }

  addnewtask() {
    setState(() {
      allTasks.add(
        Task(title: myController.text, status: false),
      );
    });
  }

  final myController = TextEditingController();

  int calculateCompletedTasks() {
    int completedTasks = 0;

    allTasks.forEach((item) {
      if (item.status) {
        completedTasks++;
      }
    });

    return completedTasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11)),
                child: Container(
                  padding: EdgeInsets.all(22),
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                          controller: myController,
                          maxLength: 20,
                          decoration:
                              InputDecoration(hintText: "Add new Task")),
                      SizedBox(
                        height: 22,
                      ),
                      TextButton(
                          onPressed: () {
                            addnewtask();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "ADD",
                            style: TextStyle(fontSize: 22),
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                deleteall();
              },
              icon: Icon(
                Icons.delete_forever,
                color: Color.fromARGB(255, 196, 77, 104),
              ))
        ],
        elevation: 0,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        title: Text(
          "TO DO APP",
          style: TextStyle(
              fontSize: 33, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Counter(
                allTodos: allTasks.length,
                allCompleted: calculateCompletedTasks()),
            Container(
              margin: EdgeInsets.only(top: 22),
              height: 550,
              color: Color.fromARGB(255, 55, 63, 82),
              child: ListView.builder(
                  itemCount: allTasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Todecard(
                        vartitle: allTasks[index].title,
                        doneORnot: allTasks[index].status,
                        changeStatus: changeStatus,
                        delete: delete,
                        index: index);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
