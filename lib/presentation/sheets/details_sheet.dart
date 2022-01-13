import 'package:final_exam_task/data/models/todo.dart';
import 'package:final_exam_task/data/repository/todo_repository.dart';
import 'package:final_exam_task/presentation/sheets/edit_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget detailsSheet(Todo todoc, deviceSize, context, id, todo, description) =>
    Container(
      height: deviceSize.height / 2,
      color: const Color(0xff04a3a3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Title',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            todoc.todo.toString(),
            style: GoogleFonts.poppins(
              fontSize: 17,
              fontStyle: FontStyle.normal,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Todo Description",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            todoc.description.toString(),
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontStyle: FontStyle.normal,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff04a3a3).withOpacity(0.5))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(
                          Icons.done,
                          size: 50,
                        ),
                        Text("Done")
                      ],
                    ),
                    onPressed: () {
                      TodoRepository().markDone(todoc.id!);
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff04a3a3).withOpacity(0.5))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(
                          Icons.edit,
                          size: 50,
                        ),
                        Text("Edit"),
                      ],
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) => editSheet(
                            deviceSize, todoc, context, id, todo, description),
                      );
                    },
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff04a3a3).withOpacity(0.5))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(
                          Icons.delete,
                          size: 50,
                        ),
                        Text("Delete")
                      ],
                    ),
                    onPressed: () {
                      TodoRepository().deleteTodos(todoc.id!);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
