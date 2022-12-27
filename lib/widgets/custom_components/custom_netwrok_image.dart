import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    required this.imagePath,
    this.height,
  }) : super(key: key);

  final String imagePath;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath,
      height: height,
      fit: height != null ? BoxFit.fitHeight : null,
      loadingBuilder: (_, image, chunkEvent) {
        if (chunkEvent == null) {
          return image;
        }
        return const CircularProgressIndicator.adaptive(
          backgroundColor: Colors.black,
        );
      },
      errorBuilder: (_, __, ___) {
        return const Text('Error Loading the Image!');
      },
    );
  }
}
