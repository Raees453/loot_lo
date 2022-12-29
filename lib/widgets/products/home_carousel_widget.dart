import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lootlo/utils/constants/app_constants.dart';
import 'package:lootlo/widgets/custom_components/custom_network_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeCarouselWidget extends StatefulWidget {
  const HomeCarouselWidget({Key? key}) : super(key: key);

  @override
  State<HomeCarouselWidget> createState() => _HomeCarouselWidgetState();
}

class _HomeCarouselWidgetState extends State<HomeCarouselWidget> {
  final pageController = PageController();

  final imagePaths = [
    'http://cdn.shopify.com/s/files/1/0553/3774/6621/files/rufus_file_women.jpg?v=1639142473',
    'https://img.freepik.com/premium-vector/12-12-shopping-day-sale-poster-flyer-design_32996-359.jpg?w=2000',
    'https://img.freepik.com/premium-vector/12-12-shopping-day-sale-poster-flyer-design_32996-359.jpg?w=2000',
    'https://img.freepik.com/premium-vector/12-12-shopping-day-sale-poster-flyer-design_32996-359.jpg?w=2000',
  ];

  int _currentPage = 0;
  late final Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(
      const Duration(seconds: AppConstants.bannerAnimationDelaySeconds),
      (timer) {
        if (_currentPage < imagePaths.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: imagePaths.length,
              itemBuilder: (_, index) => buildCarouseWidget(
                imagePaths.elementAt(index),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SmoothPageIndicator(
            effect: WormEffect(
              dotWidth: AppConstants.wormIndicatorWidth,
              dotHeight: AppConstants.wormIndicatorHeight,
              activeDotColor: Theme.of(context).primaryColor,
            ),
            onDotClicked: (int index) => pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            ),
            controller: pageController,
            count: imagePaths.length,
          ),
        ],
      ),
    );
  }

  Widget buildCarouseWidget(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      child: CustomNetworkImage(
        imagePath: imagePath,
        width: double.infinity,
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
