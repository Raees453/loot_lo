import 'package:flutter/material.dart';
import 'package:lootlo/hard_coded.dart';
import 'package:lootlo/models/product.dart';
import 'package:lootlo/screens/product/product_details_screen.dart';
import 'package:lootlo/utils/constants/app_constants.dart';
import 'package:lootlo/widgets/products/product/horizontal_product_view_widget.dart';

class ProductNotificationsScreen extends StatelessWidget {
  ProductNotificationsScreen({Key? key}) : super(key: key);

  final products = allProducts;

  final String title = 'Price drop alert. Buy one get one free';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.fullScreenPadding),
      child: ListView.separated(
        itemBuilder: (_, index) => ProductNotificationWidget(
          product: products.elementAt(index),
          title: title,
        ),
        separatorBuilder: (_, index) => const SizedBox(height: 10),
        itemCount: products.length,
      ),
    );
  }
}

class ProductNotificationWidget extends StatelessWidget {
  const ProductNotificationWidget({
    Key? key,
    required this.product,
    required this.title,
  }) : super(key: key);

  final Product product;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        ProductDetailsScreen.routeName,
        arguments: product,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          children: [
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.orangeAccent,
                child: Icon(
                  Icons.lightbulb,
                  color: Colors.white,
                ),
              ),
              title: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
              subtitle: const Text(
                'Yesterday',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.horizontalPadding,
              ),
              child: Divider(thickness: 1.5),
            ),
            HorizontalProductViewWidget(product: product),
          ],
        ),
      ),
    );
  }
}
