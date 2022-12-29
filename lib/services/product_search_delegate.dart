import 'package:flutter/material.dart';
import 'package:lootlo/hard_coded.dart';
import 'package:lootlo/models/product.dart';
import 'package:lootlo/screens/product/product_details_screen.dart';
import 'package:lootlo/utils/constants/app_constants.dart';
import 'package:lootlo/widgets/custom_components/custom_network_image.dart';
import 'package:lootlo/widgets/products/products_grid_widget.dart';

class ProductSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      // onPressed: () => Navigator.of(context).pop(),
      icon: const Icon(Icons.arrow_back_ios_new),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text('Start Entering to search...'),
      );
    }

    final products = allProducts
        .where(
          (element) => element.title.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    if (products.isEmpty) {
      return const Center(
        child: Text('No Product found'),
      );
    }

    return buildResultsWidget(context, products);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text('Start Entering to search...'),
      );
    }

    final products = allProducts.where(
        (element) => element.title.toLowerCase().contains(query.toLowerCase()));

    if (products.isEmpty) {
      return Container();
    }

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (_, index) => ListTile(
        title: buildProductTile(products.elementAt(index)),
        onTap: () => Navigator.of(context).pushNamed(
          ProductDetailsScreen.routeName,
          arguments: products.elementAt(index),
        ),
      ),
    );
  }

  Widget buildResultsWidget(BuildContext context, List<Product> products) {
    return Column(
      children: [
        buildFiltersRow(context),
        Expanded(
          child: ProductsGridWidget(products: products),
        ),
      ],
    );
  }

  Widget buildFiltersRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppConstants.horizontalPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            child: buildTextIconRow('Best Match', Icons.thumb_up_alt_outlined),
          ),
          TextButton(
            onPressed: () {},
            child: buildTextIconRow(
                'Top Sales', Icons.local_fire_department_outlined),
          ),
          TextButton(
            onPressed: () {},
            child: buildTextIconRow('New', Icons.access_time),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 20,
                child: VerticalDivider(
                  color: Colors.black54,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.filter_list_sharp,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTextIconRow(String text, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text),
        const SizedBox(width: 5),
        Icon(
          icon,
          size: 20,
        ),
      ],
    );
  }

  Widget buildProductTile(Product product) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CustomNetworkImage(
        imagePath: product.imagePaths.first,
        width: 40,
        height: 40,
      ),
      title: Text(product.title),
      subtitle: Text(
        product.description,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
