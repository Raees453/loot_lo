import 'package:flutter/material.dart';
import 'package:lootlo/models/product.dart';
import 'package:lootlo/utils/constants/app_constants.dart';

import '../../../screens/product/product_images_view_screen.dart';
import '../../custom_components/custom_network_image.dart';

class ProductImagesWidget extends StatefulWidget {
  ProductImagesWidget({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<ProductImagesWidget> createState() => _ProductImagesWidgetState();
}

class _ProductImagesWidgetState extends State<ProductImagesWidget> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        ProductImagesViewScreen.routeName,
        arguments: widget.product,
      ),
      child: SizedBox(
        height: AppConstants.productImageHeight,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              onPageChanged: (int pageNum) {
                setState(() {
                  currentPage = pageNum;
                });
              },
              children: widget.product.imagePaths
                  .map(
                    (e) => CustomNetworkImage(
                      imagePath: e,
                      height: AppConstants.productImageHeight,
                    ),
                  )
                  .toList(),
            ),
            buildImagesCountWidget(
              currentPage + 1,
              widget.product.imagePaths.length,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImagesCountWidget(int current, int total) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          '$current/$total',
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
