import 'package:flutter/material.dart';
import 'package:lootlo/widgets/custom_components/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(context, 'Profile'),
      body: const Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}
