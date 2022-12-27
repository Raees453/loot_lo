import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    required this.imagePath,
    this.height,
    this.width,
  }) : super(key: key);

  final String imagePath;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath,
      height: height,
      width: width,
      fit: height != null
          ? BoxFit.fitHeight
          : width != null
              ? BoxFit.cover
              : null,
      loadingBuilder: (_, image, chunkEvent) {
        if (chunkEvent == null) {
          return image;
        }

        return Shimmer.fromColors(
          baseColor: Colors.black12,
          highlightColor: Colors.grey,
          child: Container(
            width: double.infinity,
            color: Colors.white,
            height: height,
          ),
        );
      },
      errorBuilder: (_, __, ___) {
        return const Padding(
          padding: EdgeInsets.all(16.0),
          child: Placeholder(),
        );
      },
    );
  }
}
