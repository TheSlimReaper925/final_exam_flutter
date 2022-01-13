import 'package:final_exam_task/logic/providers/todo_provider.dart';
import 'package:final_exam_task/presentation/screen/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/screen/home_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => TodoProvider())],
    child: MyApp(),
  ));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      routes: {
        FirstPage.routeName: (context) => FirstPage(),
      },
    );
  }
}
