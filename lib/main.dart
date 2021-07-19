import 'package:flutter/material.dart';
import 'package:local_storage/screens/home.dart';
import 'package:local_storage/screens/setttings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>Home(),
        '/settings':(context)=>Settings(),
      },
    );
  }
}

