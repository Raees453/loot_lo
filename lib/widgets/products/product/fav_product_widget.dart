import 'package:flutter/material.dart';
import 'package:lootlo/screens/product/product_details_screen.dart';

import '../../../models/product.dart';
import '../../../utils/constants/app_constants.dart';

class FavProductWidget extends StatefulWidget {
  final Product product;

  const FavProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  State<FavProductWidget> createState() => _FavProductWidgetState();
}

class _FavProductWidgetState extends State<FavProductWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(ProductDetailsScreen.routeName, arguments: widget.product),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            _ProductView(product: widget.product),
            IconButton(
              onPressed: () {
                setState(() {
                  widget.product.toggleFavourite();
                });
              },
              icon: Icon(
                widget.product.isFavourite
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductView extends StatelessWidget {
  final Product product;

  const _ProductView({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius / 4),
          child: Image.network(
            product.imagePath,
            height: size * 0.4,
            width: size * 0.4,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          product.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          product.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.grey[500],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'PKR: ${product.price}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
