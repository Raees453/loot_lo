class Product {
  final String title;
  final String description;
  final int price;
  final List<String> imagePaths;
  final String imagePath;
  bool isFavourite = false;

  Product({
    required this.title,
    required this.imagePath,
    required this.description,
    required this.price,
    required this.imagePaths,
  });

  void toggleFavourite() {
    isFavourite = !isFavourite;
  }

  @override
  String toString() {
    return 'Product{title: $title, description: $description, price: $price, imagePaths: $imagePaths, imagePath: $imagePath, isFavourite: $isFavourite}';
  }
}
