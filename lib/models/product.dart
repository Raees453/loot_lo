class Product {
  final String title;
  final String imagePath;
  final String description;
  final int price;
  bool isFavourite = false;

  Product({
    required this.title,
    required this.imagePath,
    required this.description,
    required this.price,
  });

  void toggleFavourite() {
    isFavourite = !isFavourite;
  }
}
