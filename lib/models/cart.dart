import 'package:lootlo/models/product.dart';

class Cart {
  final Map<Product, int> products = {};
  final List<Product> allProducts = [];

  int totalAmount = 0;

  void addProduct(Product product) {
    if (products.containsKey(product)) {
      products.update(product, (value) => value + 1);
    } else {
      products.putIfAbsent(product, () => 1);
      allProducts.add(product);
    }
    totalAmount += product.price;
  }

  void removeProduct(Product product) {
    if (products.containsKey(product)) {
      int? count = products[product];
      if (count != null && count > 1) {
        products.update(product, (value) => value - 1);
      } else {
        products.remove(product);
      }
      totalAmount -= product.price;
      allProducts.remove(product);
    }
  }

  int getCountOfProduct(Product product) {
    if (products.containsKey(product)) {
      return products[product]!;
    }
    return 0;
  }
}
