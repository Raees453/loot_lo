import 'package:flutter/material.dart';
import 'package:lootlo/screens/home_screen.dart';
import 'package:lootlo/utils/routes.dart';

// TODO Research for Address Options
// TODO Build Drawer & Everything Related
// TODO Create Orders Screen and Find a Place to integrate the option for this as well
// TODO Create a search screen
// TODO Apply Filter View to search screen
// TODO Build Carousel for Home Products Page
// TODO Build Profile Screen as well

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
