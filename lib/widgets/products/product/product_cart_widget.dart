import 'package:flutter/material.dart';
import 'package:lootlo/models/product.dart';

import '../../../models/cart.dart';
import '../../../screens/product/product_details_screen.dart';
import '../../../utils/constants/app_constants.dart';

class ProductCartWidget extends StatefulWidget {
  const ProductCartWidget(
      {Key? key, required this.product, required this.num, required this.cart})
      : super(key: key);

  final Cart cart;
  final Product product;
  final int num;

  @override
  State<ProductCartWidget> createState() => _ProductCartWidgetState();
}

class _ProductCartWidgetState extends State<ProductCartWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context)
          .pushNamed(ProductDetailsScreen.routeName, arguments: widget.product),
      minVerticalPadding: 10,
      contentPadding: EdgeInsets.zero,
      title: Text(
        widget.product.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: buildAddRemoveTile(),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.delete),
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius / 4),
        child: Image.network(
          widget.product.imagePath,
          height: 100,
          width: 70,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget buildAddRemoveTile() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () =>
              setState(() => widget.cart.removeProduct(widget.product)),
          icon: const Icon(Icons.remove),
        ),
        Text('${widget.cart.getCountOfProduct(widget.product)}'),
        IconButton(
          onPressed: () =>
              setState(() => widget.cart.addProduct(widget.product)),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
