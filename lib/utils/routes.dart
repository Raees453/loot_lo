import 'package:flutter/cupertino.dart';
import 'package:lootlo/screens/account/profile_screen.dart';
import 'package:lootlo/screens/account/wallet_screen.dart';
import 'package:lootlo/screens/auth/login_screen.dart';
import 'package:lootlo/screens/home_screen.dart';
import 'package:lootlo/screens/orders/orders_screen.dart';
import 'package:lootlo/screens/product/product_details_screen.dart';
import 'package:lootlo/screens/product/product_images_view_screen.dart';

import '../screens/auth/sign_up_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      LoginScreen.routeName: (_) => const LoginScreen(),
      SignUpScreen.routeName: (_) => const SignUpScreen(),
      HomeScreen.routeName: (_) => const HomeScreen(),
      WalletScreen.routeName: (_) => const WalletScreen(),
      ProductDetailsScreen.routeName: (_) => const ProductDetailsScreen(),
      ProductImagesViewScreen.routeName: (_) => const ProductImagesViewScreen(),
      ProfileScreen.routeName: (_) => const ProfileScreen(),
      OrdersScreen.routeName: (_) => const OrdersScreen(),
    };
  }
}
