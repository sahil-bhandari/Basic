import 'package:flutter/material.dart';
import 'package:Test/view/homescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Demo',
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor:  Colors.blueAccent,
        accentColor: Colors.blueGrey,
        primaryColorDark: Colors.blueAccent,
      ),
      home: new MyHomePage(title: 'Home'),
    );
  }
}
