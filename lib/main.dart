import 'package:flutter/material.dart';
import 'package:lootlo/screens/home_screen.dart';
import 'package:lootlo/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.getRoutes(),
      home: HomeScreen(),
    );
  }
}
