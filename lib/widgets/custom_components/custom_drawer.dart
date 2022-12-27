import 'package:flutter/material.dart';
import 'package:lootlo/screens/account/profile_screen.dart';
import 'package:lootlo/screens/auth/login_screen.dart';
import 'package:lootlo/screens/home_screen.dart';
import 'package:lootlo/screens/orders/orders_screen.dart';

import '../../utils/constants/app_constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size * 0.1),
          buildProfileTab(),
          const Padding(
            padding: EdgeInsets.only(right: 125.0, left: 16.0),
            child: Divider(thickness: 1.5),
          ),
          const SizedBox(height: 20),
          buildDrawerTile(
            context,
            Icons.person_outline_outlined,
            'Profile',
            () => Navigator.of(context).pushNamed(ProfileScreen.routeName),
          ),
          buildDrawerTile(
            context,
            Icons.home_filled,
            'Home Screen',
            () => Navigator.of(context)
                .pushReplacementNamed(HomeScreen.routeName, arguments: 0),
          ),
          buildDrawerTile(
            context,
            Icons.favorite_border,
            'Favourite',
            () => Navigator.of(context)
                .pushReplacementNamed(HomeScreen.routeName, arguments: 1),
          ),
          buildDrawerTile(
            context,
            Icons.shopping_bag_outlined,
            'My Cart',
            () => Navigator.of(context)
                .pushReplacementNamed(HomeScreen.routeName, arguments: 2),
          ),
          buildDrawerTile(
            context,
            Icons.fire_truck_outlined,
            'Orders',
            () => Navigator.of(context).pushNamed(OrdersScreen.routeName),
          ),
          buildDrawerTile(
            context,
            Icons.notifications_active_outlined,
            'Notifications',
            () => Navigator.of(context).pushNamed(ProfileScreen.routeName),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(right: 125.0, left: 16.0),
            child: Divider(thickness: 1.5),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: buildDrawerTile(
              context,
              Icons.logout,
              'Sign Out',
              () => Navigator.of(context)
                  .pushReplacementNamed(LoginScreen.routeName),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDrawerTile(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }

  Widget buildProfileTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.horizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
              'https://cdn-icons-png.flaticon.com/512/599/599609.png?w=1480&t=st=1672100307~exp=1672100907~hmac=5902091c8f5752d3b83daa629392a25ca0c82236ff8bf01ecfca03024ae33644',
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Raees Ali',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
