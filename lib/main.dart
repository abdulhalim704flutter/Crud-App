import 'package:crud_app/Screen/ProductCreateScreen.dart';
import 'package:crud_app/Screen/ProductGridViewScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Crud App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ProductGridViewScreen(),
    );
  }
}


