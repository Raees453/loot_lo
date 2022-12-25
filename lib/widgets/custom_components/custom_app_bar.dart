import 'package:flutter/material.dart';

import '../../utils/constants/app_constants.dart';

class CustomAppBar {
  static AppBar getAppBar(String title) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      title: Text(title),
      leading: Padding(
        padding: const EdgeInsets.only(left: AppConstants.fullScreenPadding),
        child: IconButton(
          icon: const Icon(
            Icons.blur_circular_sharp,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: AppConstants.fullScreenPadding),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
