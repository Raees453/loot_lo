import 'package:flutter/material.dart';
import 'package:lootlo/screens/home_screen.dart';
import 'package:lootlo/services/location_service.dart';
import 'package:lootlo/utils/routes.dart';

// TODO Research for Address Options
// TODO Create Orders Screen and Find a Place to integrate the option for this as well
// TODO Apply Filter View to search screen
// TODO Build Profile Screen as well

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final position = await LocationService.getCurrentLocation();
  runApp(const MyApp());
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
