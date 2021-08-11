import 'package:flutter/material.dart';
import 'package:news_demo/Screens/Home.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "internshala assignment",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
