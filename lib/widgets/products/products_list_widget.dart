import 'package:flutter/material.dart';
import 'package:lootlo/hard_coded.dart';
import 'package:lootlo/widgets/products/product/horizontal_product_view_widget.dart';
import 'package:lootlo/widgets/products/product/vertical_product_view_widget.dart';

class ProductsListWidget extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final VoidCallback onPressed;
  final products = allProducts;
  final bool isVertical;

  ProductsListWidget({
    super.key,
    required this.title,
    required this.buttonTitle,
    required this.onPressed,
    this.isVertical = true,
  });

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

    final column = Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: style,
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(buttonTitle),
            ),
          ],
        ),
        !isVertical
            ? Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  separatorBuilder: (_, index) => const SizedBox(width: 15),
                  itemBuilder: (_, index) => VerticalProductViewWidget(
                    product: products.elementAt(index),
                  ),
                ),
              )
            : ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                separatorBuilder: (_, index) => const SizedBox(height: 15),
                itemBuilder: (_, index) => HorizontalProductViewWidget(
                  product: products.elementAt(index),
                ),
              ),
      ],
    );

    return isVertical
        ? column
        : SizedBox(
            height: 380,
            child: column,
          );
  }
}
