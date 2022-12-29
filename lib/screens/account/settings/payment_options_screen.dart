import 'package:flutter/material.dart';
import 'package:lootlo/widgets/custom_components/custom_app_bar.dart';

class PaymentOptionsScreen extends StatelessWidget {
  static const String routeName = '/payment-options';

  PaymentOptionsScreen({Key? key}) : super(key: key);

  final paymentOptions = [
    ['JazzCash', '+92******318'],
    ['Debit', '+92******318'],
    ['Visa', '+92******318'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(context, 'Payment Options'),
      body: ListView.separated(
        itemCount: paymentOptions.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (_, index) => buildPaymentOptionTile(
          paymentOptions[index][0],
          paymentOptions[index][1],
          Icons.payment,
        ),
      ),
    );
  }

  Widget buildPaymentOptionTile(String title, String subTitle, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {},
      ),
    );
  }
}
