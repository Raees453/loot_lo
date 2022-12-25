import 'package:flutter/material.dart';
import 'package:lootlo/utils/constants/app_constants.dart';

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
          buildSettingsTile('Notification Settings', Icons.notifications),
          buildSettingsTile('Shipping Address', Icons.add_home_work_outlined),
          buildSettingsTile('Payment Info', Icons.payment),
          buildSettingsTile('Delete Account', Icons.delete),
          const SizedBox(height: 40),
          buildCategoryTitleText('App Settings'),
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

  Widget buildSettingsTile(String title, IconData iconData) {
    return ListTile(
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
