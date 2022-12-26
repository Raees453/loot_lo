import 'package:flutter/material.dart';
import 'package:lootlo/widgets/custom_components/custom_app_bar.dart';

class WalletScreen extends StatelessWidget {
  static const String routeName = '/wallet';

  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(context, 'Wallet', showLeading: true),
      body: const Center(
        child: Text('Wallet Screen'),
      ),
    );
  }
}
