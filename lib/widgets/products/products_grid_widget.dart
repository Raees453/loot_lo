import 'package:flutter/material.dart';

import '../../hard_coded.dart';

class ProductsGridWidget extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final VoidCallback onPressed;
  final products = allProducts;

  ProductsGridWidget({
    Key? key,
    required this.title,
    required this.buttonTitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    );
  }
}
