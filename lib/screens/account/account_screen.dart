import 'package:flutter/material.dart';
import 'package:lootlo/screens/account/profile_screen.dart';
import 'package:lootlo/screens/account/settings/address_book_screen.dart';
import 'package:lootlo/screens/account/settings/notification_settings.dart';
import 'package:lootlo/screens/account/settings/payment_options_screen.dart';
import 'package:lootlo/utils/constants/app_constants.dart';
import 'package:lootlo/widgets/dialogues/app_language_dialogue.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.fullScreenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          buildCategoryTitleText('Account Settings'),
          const SizedBox(height: 10),
          buildSettingsTile(
            'Profile',
            Icons.person,
            onTap: () =>
                Navigator.of(context).pushNamed(ProfileScreen.routeName),
          ),
          buildSettingsTile(
            'Address Book',
            Icons.my_location,
            onTap: () =>
                Navigator.of(context).pushNamed(AddressBookScreen.routeName),
          ),
          buildSettingsTile(
            'Language',
            Icons.language,
            onTap: () => showDialog(
              context: context,
              builder: (_) => AppLanguageDialogue(),
            ),
          ),
          buildSettingsTile(
            'Payment Options',
            Icons.payment,
            onTap: () =>
                Navigator.of(context).pushNamed(PaymentOptionsScreen.routeName),
          ),
          buildSettingsTile('Help Center', Icons.help_outline),
          buildSettingsTile('My Reviews', Icons.reviews),
          buildSettingsTile('Rewards & Vouchers', Icons.pages),
          buildSettingsTile('My Orders', Icons.padding),
          buildSettingsTile(
            'Notification Settings',
            Icons.notifications,
            onTap: () => Navigator.of(context)
                .pushNamed(NotificationSettingsScreen.routeName),
          ),
          const SizedBox(height: 40),
          buildCategoryTitleText('App Settings'),
          const SizedBox(height: 10),
          buildSwitchTile(context, 'Enable Face ID for Log in', false),
          buildSwitchTile(context, 'Location Services', true),
          buildSwitchTile(context, 'Dark Mode', false),
        ],
      ),
    );
  }

  Widget buildCategoryTitleText(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Widget buildSettingsTile(String title, IconData iconData,
      {VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      minLeadingWidth: 0,
      leading: Icon(iconData),
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      trailing: IconButton(
        icon: const Icon(
          Icons.keyboard_arrow_right_outlined,
          size: 30,
        ),
        onPressed: () {},
      ),
    );
  }

  Widget buildSwitchTile(BuildContext context, String title, bool isOn) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      trailing: Switch.adaptive(
        value: isOn,
        activeColor: Theme.of(context).primaryColor,
        onChanged: (isOnOff) {},
      ),
    );
  }
}
