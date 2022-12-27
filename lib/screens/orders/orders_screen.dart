import 'package:flutter/material.dart';
import 'package:lootlo/widgets/custom_components/custom_app_bar.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = '/orders';

  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(context, 'Orders'),
      body: const Center(
        child: Text('Orders Screen'),
      ),
    );
  }
}
