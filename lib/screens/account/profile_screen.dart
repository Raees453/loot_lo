import 'package:flutter/material.dart';
import 'package:lootlo/utils/constants/app_constants.dart';
import 'package:lootlo/widgets/custom_components/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.appBackgroundColor,
      appBar: CustomAppBar.getAppBar(context, 'Profile'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Center(child: buildProfileWidget()),
            const SizedBox(height: 30),
            buildDetailsColumn('Full Name', 'Raees Ali'),
            buildDetailsColumn('Email Address', 'raeesali453@gmail.com'),
            buildDetailsColumn('Full Name', 'Raees Ali'),
          ],
        ),
      ),
    );
  }

  Widget buildProfileWidget() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        const CircleAvatar(
          radius: 60,
          child: Icon(
            Icons.person,
            size: 80,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: GestureDetector(
            onTap: () {
              print('Hello');
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDetailsColumn(String title, String text) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Text(text),
          )
        ],
      ),
    );
  }
}
