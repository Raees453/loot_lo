import 'package:flutter/material.dart';
import 'package:lootlo/models/product.dart';
import 'package:lootlo/utils/constants/app_constants.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.appBackgroundColor,
      body: const Center(
        child: Text('Products Details Screen'),
      ),
    );
  }
}
