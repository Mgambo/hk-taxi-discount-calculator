import 'package:flutter/material.dart';
import './consts/languages/chinese.dart';
import './screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxi Price Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 20.0)),
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(title: label.title),
    );
  }
}
