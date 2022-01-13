import 'package:final_exam_task/data/models/todo.dart';
import 'package:final_exam_task/logic/providers/todo_provider.dart';
import 'package:final_exam_task/presentation/sheets/add_sheet.dart';
import 'package:final_exam_task/presentation/sheets/details_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);

  static const routeName = '/first-page';
  TextEditingController id = TextEditingController();
  TextEditingController todo = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<TodoProvider>().todo;
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TODO APP",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.normal,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff04a3a3),
                        shape: const CircleBorder(),
                        elevation: 0,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) => addSheet(
                              deviceSize, id, todo, description, context),
                        );
                      },
                      child: const Icon(Icons.add)),
                ),
              ],
            ),
          ),
          Flexible(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    right: 35,
                    left: 35,
                  ),
                  height: double.infinity,
                  decoration: ShapeDecoration(
                    color: const Color(0xff04a3a3).withOpacity(0.5),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                  child: FutureBuilder(
                    future: todos,
                    builder: (ctx, snapshot) {
                      if (snapshot.hasData) {
                        final todoList = snapshot.data as List<Todo>;
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            if (todoList[index].isDone == true) {
                              return Container(
                                padding: const EdgeInsets.only(
                                  bottom: 20,
                                ),
                                child: Card(
                                  color: Colors.white,
                                  child: ListTile(
                                    key: UniqueKey(),
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              detailsSheet(
                                                todoList[index],
                                                deviceSize,
                                                context,
                                                id,
                                                todo,
                                                description,
                                              ));
                                    },
                                    trailing: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: const ShapeDecoration(
                                        color: Colors.green,
                                        shape: CircleBorder(),
                                      ),
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                                    ),
                                    title: Text(
                                      todoList[index].todo.toString(),
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      todoList[index].description.toString(),
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Container(
                                padding: const EdgeInsets.only(
                                  bottom: 20,
                                ),
                                child: Card(
                                  color: Colors.white,
                                  child: ListTile(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            detailsSheet(
                                          todoList[index],
                                          deviceSize,
                                          context,
                                          id,
                                          todo,
                                          description,
                                        ),
                                      );
                                    },
                                    key: UniqueKey(),
                                    trailing: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: const ShapeDecoration(
                                        color: Colors.grey,
                                        shape: CircleBorder(),
                                      ),
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                                    ),
                                    title: Text(
                                      todoList[index].todo.toString(),
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      todoList[index].description.toString(),
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                          itemCount: todoList.length,
                        );
                      } else {
                        return const Center(
                          child: Text("Loading..."),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
