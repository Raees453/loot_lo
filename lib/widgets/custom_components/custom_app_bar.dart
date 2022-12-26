import 'package:flutter/material.dart';
import 'package:lootlo/screens/account/wallet_screen.dart';
import 'package:lootlo/screens/custom_back_button.dart';

import '../../utils/constants/app_constants.dart';

class CustomAppBar {
  static AppBar getAppBar(
    BuildContext context,
    String title, {
    bool showLeading = false,
  }) {
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
        child: showLeading
            ? const CustomBackButton()
            : IconButton(
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
            onPressed: () =>
                Navigator.of(context).pushNamed(WalletScreen.routeName),
            icon: const Icon(
              Icons.wallet,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
