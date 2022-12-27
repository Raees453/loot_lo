import 'package:flutter/material.dart';
import 'package:lootlo/models/product.dart';
import 'package:lootlo/utils/constants/app_constants.dart';
import 'package:lootlo/widgets/custom_components/custom_netwrok_image.dart';

import '../../../screens/product/product_images_view_screen.dart';

class ProductImagesWidget extends StatelessWidget {
  const ProductImagesWidget({Key? key, required this.product})
      : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(ProductImagesViewScreen.routeName, arguments: product),
      child: SizedBox(
        height: AppConstants.productImageHeight,
        child: PageView(
          children: product.imagePaths
              .map((e) => CustomNetworkImage(
                    imagePath: e,
                    height: AppConstants.productImageHeight,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
