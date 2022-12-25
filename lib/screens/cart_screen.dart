import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lootlo/hard_coded.dart';
import 'package:lootlo/models/cart.dart';
import 'package:lootlo/utils/constants/app_constants.dart';
import 'package:lootlo/widgets/custom_components/custom_button.dart';
import 'package:lootlo/widgets/products/product/product_cart_widget.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    cart.addProduct(allProducts.first);
    cart.addProduct(allProducts.first);
    cart.addProduct(allProducts.first);
    cart.addProduct(allProducts.elementAt(2));
    cart.addProduct(allProducts.elementAt(2));
    // cart.addProduct(allProducts.elem/entAt(6));
    cart.addProduct(allProducts.last);
    cart.addProduct(allProducts.last);

    final products = cart.allProducts;
    return Padding(
      padding: const EdgeInsets.all(AppConstants.fullScreenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (_, index) {
                return ProductCartWidget(
                  product: products.elementAt(index),
                  num: cart.getCountOfProduct(products.elementAt(index)),
                  cart: cart,
                );
              },
            ),
          ),
          const Spacer(),
          const Divider(thickness: 2),
          buildTotalTextWidget(),
          CustomButton(text: 'Checkout', onPressed: () {}),
        ],
      ),
    );
  }

  ListTile buildTotalTextWidget() {
    var formatter = NumberFormat("#,##,###", "en_US");
    const style = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    return ListTile(
      title: const Text(
        'Total:',
        style: style,
      ),
      trailing: Text(
        'PKR ${formatter.format(cart.totalAmount)}',
        style: style,
      ),
    );
  }
}
