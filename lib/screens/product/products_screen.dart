import 'package:flutter/material.dart';

import '../../utils/constants/app_constants.dart';
import '../../widgets/products/home_carousel_widget.dart';
import '../../widgets/products/products_list_widget.dart';
import '../home_screen.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.fullScreenPadding),
      child: Column(
        children: [
          const SearchButtonBar(),
          const SizedBox(height: 20),
          const HomeCarouselWidget(),
          const SizedBox(height: 20),
          ProductsListWidget(
            title: 'Popular Products',
            buttonTitle: 'See all',
            onPressed: () {},
            isVertical: false,
          ),
          const SizedBox(height: 20),
          ProductsListWidget(
            title: 'New Products',
            buttonTitle: 'See all',
            onPressed: () {},
          ),
          const SizedBox(height: 20),
          ProductsListWidget(
            title: 'Popular Products',
            buttonTitle: 'See all',
            onPressed: () {},
            isVertical: false,
          ),
          const SizedBox(height: 20),
          ProductsListWidget(
            title: 'New Products',
            buttonTitle: 'See all',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
