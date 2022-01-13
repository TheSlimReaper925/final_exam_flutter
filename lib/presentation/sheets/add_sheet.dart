import 'package:final_exam_task/data/repository/todo_repository.dart';
import 'package:flutter/material.dart';

Widget addSheet(
        deviceSize,
        TextEditingController id,
        TextEditingController todo,
        TextEditingController description,
        context) =>
    Container(
      height: deviceSize.height / 2,
      color: const Color(0xff04a3a3),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: GlobalKey(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: id,
                decoration: const InputDecoration(hintText: "Enter todo ID"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter valid ID";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: todo,
                decoration: const InputDecoration(hintText: "Enter todo name"),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter valid name";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: description,
                decoration:
                    const InputDecoration(hintText: "Enter todo description"),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter valid description";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  TodoRepository().addTodos(
                      int.parse(id.text), todo.text, description.text);
                  Navigator.pop(context);
                },
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
