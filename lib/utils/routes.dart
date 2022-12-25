import 'package:flutter/cupertino.dart';
import 'package:lootlo/screens/home_screen.dart';
import 'package:lootlo/screens/login_screen.dart';
import 'package:lootlo/screens/sign_up_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      LoginScreen.routeName: (_) => const LoginScreen(),
      SignUpScreen.routeName: (_) => const SignUpScreen(),
      HomeScreen.routeName: (_) => const HomeScreen(),
    };
  }
}
