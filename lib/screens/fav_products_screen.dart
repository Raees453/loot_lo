import 'package:flutter/material.dart';
import 'package:lootlo/hard_coded.dart';
import 'package:lootlo/utils/constants/app_constants.dart';
import 'package:lootlo/widgets/products/product/fav_product_widget.dart';

class FavProductsScreen extends StatelessWidget {
  FavProductsScreen({Key? key}) : super(key: key);

  final products = allProducts;

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(AppConstants.fullScreenPadding),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      children: products.map((e) => FavProductWidget(product: e)).toList(),
    );
  }
}
