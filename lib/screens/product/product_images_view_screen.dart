import 'package:flutter/material.dart';
import 'package:lootlo/models/product.dart';
import 'package:lootlo/utils/constants/app_constants.dart';
import 'package:lootlo/widgets/custom_components/custom_netwrok_image.dart';

class ProductImagesViewScreen extends StatefulWidget {
  static const String routeName = '/product-images-view';

  const ProductImagesViewScreen({Key? key}) : super(key: key);

  @override
  State<ProductImagesViewScreen> createState() =>
      _ProductImagesViewScreenState();
}

class _ProductImagesViewScreenState extends State<ProductImagesViewScreen>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;

  late final PageController controller;
  late final TransformationController tapController;
  late final TransformationController doubleTapController;
  TapDownDetails? tapDownDetails;

  late AnimationController animationController;
  late Animation<Matrix4> tapZoomAnimation;

  @override
  void initState() {
    controller = PageController();
    tapController = TransformationController();
    doubleTapController = TransformationController();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        tapController.value = tapZoomAnimation.value;
        doubleTapController.value = tapZoomAnimation.value;
      });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    tapController.dispose();
    doubleTapController.dispose();
    animationController.dispose();
    super.dispose();
  }

  double zoomScale = 0;

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product;
    final height = MediaQuery.of(context).size.height * 0.75;
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(product.title),
        elevation: 0,
        centerTitle: true,
      ),
      bottomSheet: buildBottomSheet(product.imagePaths),
      body: SizedBox(
        height: height,
        child: PageView(
          onPageChanged: (int selectedPage) =>
              setState(() => selectedIndex = selectedPage),
          controller: controller,
          children: product.imagePaths.map((e) => buildImage(e)).toList(),
        ),
      ),
    );
  }

  Widget buildImage(String imagePath) {
    return GestureDetector(
      onTap: () => _zoom(AppConstants.singleTapZoomScale, tapController),
      onTapDown: (tapDetails) => tapDownDetails = tapDetails,
      onDoubleTapDown: (tapDetails) => tapDownDetails = tapDetails,
      onDoubleTap: () =>
          _zoom(AppConstants.doubleTapZoomScale, doubleTapController),
      child: InteractiveViewer(
        clipBehavior: Clip.none,
        panEnabled: false,
        scaleEnabled: false,
        transformationController: tapController,
        child: CustomNetworkImage(imagePath: imagePath),
      ),
    );
  }

  Widget buildBottomSheet(List<String> imagePaths) {
    int index = -1;
    return Container(
      padding: const EdgeInsets.only(
        left: AppConstants.horizontalPadding,
        bottom: AppConstants.horizontalPadding * 2,
      ),
      color: Colors.black,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: imagePaths.map((e) {
            index++;
            return buildImageWidget(e, selectedIndex == index);
          }).toList(),
        ),
      ),
    );
  }

  Widget buildImageWidget(String imagePath, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(
        right: AppConstants.productMiniImageHeightWidth * 0.3,
      ),
      constraints: const BoxConstraints(
        minHeight: AppConstants.productMiniImageHeightWidth,
        maxHeight: AppConstants.productMiniImageHeightWidth,
        minWidth: AppConstants.productMiniImageHeightWidth,
        maxWidth: AppConstants.productMiniImageHeightWidth,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: isSelected ? Theme.of(context).primaryColor : Colors.white,
        ),
      ),
      child: CustomNetworkImage(
        imagePath: imagePath,
        height: AppConstants.productImageHeight,
      ),
    );
  }

  void _zoom(double scale, TransformationController controller) {
    final position = tapDownDetails!.localPosition;
    final x = -position.dx * (scale - 1);
    final y = -position.dy * (scale - 1);

    final zoomed = Matrix4.identity()
      ..translate(x, y)
      ..scale(scale);

    final value = controller.value.isIdentity() ? zoomed : Matrix4.identity();

    tapZoomAnimation = Matrix4Tween(
      begin: controller.value,
      end: value,
    ).animate(
      CurveTween(curve: Curves.easeOut).animate(animationController),
    );

    animationController.forward(from: 0);
  }
}
