import 'package:flutter/material.dart';
import 'package:lootlo/models/product.dart';
import 'package:lootlo/widgets/products/product/fav_product_widget.dart';

import '../../utils/constants/app_constants.dart';

class ProductsGridWidget extends StatelessWidget {
  final List<Product>? products;

  const ProductsGridWidget({
    Key? key,
    this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (products == null) {
      return const Center(
        child: Text('No Products Found'),
      );
    }

    return GridView(
      padding: const EdgeInsets.all(AppConstants.fullScreenPadding),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      children: products!.map((e) => FavProductWidget(product: e)).toList(),
    );
  }
}
