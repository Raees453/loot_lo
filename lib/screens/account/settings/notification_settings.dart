import 'package:flutter/material.dart';
import 'package:lootlo/widgets/custom_components/custom_app_bar.dart';

class NotificationSettingsScreen extends StatelessWidget {
  static const String routeName = '/notification-settings';

  const NotificationSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(context, 'Notifications'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Colors.grey,
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Push Notifications',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          NotificationSettingsTile(
            'System Notifications',
            'Receive wishlist and shopping cart updates',
            true,
          ),
          const Divider(thickness: 1),
          NotificationSettingsTile(
            'Promo Messages',
            'Receive regular updates on great deals and steals',
            true,
          ),
          const Divider(thickness: 1),
          NotificationSettingsTile(
            'Orders & Logistics',
            'Receive timely updates on your order',
            true,
          ),
          const Divider(thickness: 1),
          NotificationSettingsTile(
            'Messages',
            'Receive exclusive offers and personalized updates',
            true,
          ),
          const Divider(thickness: 1),
          NotificationSettingsTile(
            'Chats',
            'Receiver in-app messages on your phone',
            true,
          ),
          const Divider(thickness: 1),
        ],
      ),
    );
  }
}

class NotificationSettingsTile extends StatefulWidget {
  final String title;
  final String subTitle;
  bool isChecked;

  @override
  State<NotificationSettingsTile> createState() =>
      _NotificationSettingsTileState();

  NotificationSettingsTile(this.title, this.subTitle, this.isChecked,
      {super.key});
}

class _NotificationSettingsTileState extends State<NotificationSettingsTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      subtitle: Text(widget.subTitle),
      trailing: Checkbox(
        activeColor: Theme.of(context).primaryColor,
        onChanged: (value) {
          if (value != null) setState(() => widget.isChecked = value);
        },
        value: widget.isChecked,
      ),
    );
  }
}
