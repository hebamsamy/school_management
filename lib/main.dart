import 'package:flutter/material.dart';
import 'package:school_management/AddStudentScreen.dart';
import 'package:school_management/DetailsScreen.dart';
import 'package:school_management/EditStudentScreen.dart';
import 'package:school_management/HomeScreen.dart';
import 'package:school_management/ListScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(),
        "/list": (context) => ListScreen(),
        "/add": (context) => AddStudentScreen(),
        "/edit": (context) => EditStudentScreen(),
        "/details": (context) => DetailsScreen(),
      },
    );
  }
}
