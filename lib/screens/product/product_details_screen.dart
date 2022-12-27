import 'package:flutter/material.dart';
import 'package:lootlo/models/product.dart';
import 'package:lootlo/models/utils/formatter.dart';
import 'package:lootlo/utils/constants/app_constants.dart';
import 'package:lootlo/widgets/custom_components/custom_app_bar.dart';
import 'package:lootlo/widgets/custom_components/custom_button.dart';
import 'package:lootlo/widgets/products/product/product_images_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = '/product-details';

  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product?;

    if (product == null) {
      return Scaffold(
        backgroundColor: AppConstants.appBackgroundColor,
        body: const Center(
          child: Text('Products Details Screen'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppConstants.appBackgroundColor,
      appBar: CustomAppBar.getAppBar(context, product.title, showLeading: true),
      bottomSheet: buildBottomSheet(product),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImagesWidget(product: product),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(AppConstants.fullScreenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Seller Level'),
                  const SizedBox(height: 10),
                  Text(
                    product.title,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    Formatter.getFormattedPrice(product.price),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product.description,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomSheet(Product product) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.horizontalPadding,
      ),
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Price'),
                const SizedBox(height: 5),
                Text(
                  Formatter.getFormattedPrice(product.price, addPkr: false),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: CustomButton(text: 'Add to Cart', onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
