import 'package:flutter/material.dart';
import 'package:lootlo/screens/account/wallet_screen.dart';

import '../../utils/constants/app_constants.dart';
import 'custom_back_button.dart';

class CustomAppBar {
  static AppBar getAppBar(
    BuildContext context,
    String title, {
    bool showLeading = false,
  }) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(title),
      backgroundColor: Colors.transparent,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      automaticallyImplyLeading: true,
      leading: showLeading
          ? const Padding(
              padding: EdgeInsets.only(left: AppConstants.fullScreenPadding),
              child: CustomBackButton(),
            )
          : null,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: AppConstants.fullScreenPadding),
          child: IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(WalletScreen.routeName),
            icon: const Icon(
              Icons.wallet,
            ),
          ),
        ),
      ],
    );
  }
}
