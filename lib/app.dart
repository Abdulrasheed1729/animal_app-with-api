import 'package:flutter/material.dart';
import './animals/animals.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animal App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const AnimalPage(),
    );
  }
}
