import 'package:flutter/material.dart';
import 'package:lootlo/hard_coded.dart';
import 'package:lootlo/widgets/products/products_grid_widget.dart';

class FavProductsScreen extends StatelessWidget {
  FavProductsScreen({Key? key}) : super(key: key);

  final products = allProducts;

  @override
  Widget build(BuildContext context) {
    return ProductsGridWidget(
      products: products,
    );
  }
}
