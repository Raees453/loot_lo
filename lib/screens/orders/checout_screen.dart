import 'package:flutter/material.dart';
import 'package:lootlo/hard_coded.dart';
import 'package:lootlo/models/product.dart';
import 'package:lootlo/models/utils/formatter.dart';
import 'package:lootlo/utils/constants/app_constants.dart';
import 'package:lootlo/widgets/products/product/horizontal_product_view_widget.dart';

import '../../widgets/address_widget.dart';
import '../../widgets/custom_components/custom_button.dart';
import '../../widgets/utility_widgets.dart';

const TextStyle _titleStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final product = ModalRoute.of(context)?.settings.arguments as Product?;
    // if (product == null) {
    //   return Container();
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      bottomSheet: buildBottomSheet(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.fullScreenPadding),
        child: Column(
          children: [
            const CheckoutAddressWidget(),
            const SizedBox(height: 20),
            ProductCheckoutWidget(product: allProducts.first),
            const SizedBox(height: 20),
            const PromotionsWidget(),
            const SizedBox(height: 20),
            const OrderSummaryWidget(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildBottomSheet() {
    return UtilityWidgets.buildTileOf(
      'Total: Rs. 2,849',
      contentPadding: const EdgeInsets.all(16.0),
      subTitle: 'VAT included, where applicable',
      trailing: CustomButton(
        text: 'Place Order',
        onPressed: () {},
      ),
      // title: Text(),
      // subtitle:
      // trailing:
    );
  }
}

class CheckoutAddressWidget extends StatelessWidget {
  const CheckoutAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AddressWidget(message: 'Deliver to: '),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const Divider(thickness: AppConstants.dividerThickness),
                buildListTile('Bill to same address', () {}),
                const Divider(thickness: AppConstants.dividerThickness),
                buildListTile('raeesali453@gmail.com', () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListTile(String title, VoidCallback onTap) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      onTap: onTap,
      minLeadingWidth: 0,
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      trailing: const Icon(Icons.navigate_next_sharp),
    );
  }
}

class ProductCheckoutWidget extends StatelessWidget {
  const ProductCheckoutWidget({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Home!',
            style: _titleStyle,
          ),
          const Divider(thickness: AppConstants.dividerThickness),
          HorizontalProductViewWidget(product: product),
          const Divider(thickness: AppConstants.dividerThickness),
          buildDeliveryTile(),
          const Divider(thickness: AppConstants.dividerThickness),
          buildVoucherTile(),
        ],
      ),
    );
  }

  Widget buildDeliveryTile() {
    return ListTile(
      visualDensity: VisualDensity.compact,
      contentPadding: EdgeInsets.zero,
      title: const Text(
        'Standard Delivery',
        style: TextStyle(
          color: Colors.teal,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: const Text('Receive by 21 Jan - 29 Jan'),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Rs. 109',
            style: TextStyle(
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          Text(
            'FREE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildVoucherTile() {
    return ListTile(
      minLeadingWidth: 0,
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      leading: const Icon(Icons.pageview_sharp),
      title: const Text('Store Voucher'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          UtilityWidgets.buildTagBoxWidget('-Rs 50'),
          const Icon(Icons.keyboard_arrow_right)
        ],
      ),
      onTap: () {},
    );
  }
}

class PromotionsWidget extends StatelessWidget {
  const PromotionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UtilityWidgets.buildContainerOf(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Lootlo Promotions',
            style: _titleStyle,
          ),
          const SizedBox(height: 10),
          UtilityWidgets.buildTileOf(
            'Use Loot lo Wallet Coins',
            leading: const CircleAvatar(
              backgroundColor: Colors.orange,
              radius: 15,
              child: Icon(
                Icons.shop,
                size: 20,
                color: Colors.white,
              ),
            ),
            trailing: Switch.adaptive(value: false, onChanged: (value) {}),
          ),
          UtilityWidgets.buildTileOf(
            'Loot lo Voucher',
            leading: const Icon(Icons.search),
            trailing: const Text('No Voucher Found'),
          ),
          UtilityWidgets.buildTileOf(
            'Promo Code',
            leading: const Icon(Icons.code),
            trailing: TextButton(
              onPressed: () {},
              child: const Text(
                'Enter Store/Lootlo Code',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UtilityWidgets.buildContainerOf(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Order Summary', style: _titleStyle),
          const SizedBox(height: 10),
          buildRow('Items Total', Formatter.getFormattedPrice(2899)),
          const SizedBox(height: 10),
          buildRow('Delivery Fee', Formatter.getFormattedPrice(109)),
          const SizedBox(height: 10),
          buildRow('Delivery Discount', '-${Formatter.getFormattedPrice(109)}'),
          const SizedBox(height: 10),
          buildRow('Discounts', '-${Formatter.getFormattedPrice(109)}'),
          const SizedBox(height: 10),
          buildRow('Total Payments', Formatter.getFormattedPrice(2849)),
        ],
      ),
    );
  }

  Widget buildRow(String text, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        Text(price),
      ],
    );
  }
}
