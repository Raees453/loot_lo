import 'package:flutter/material.dart';
import 'package:lootlo/screens/login_screen.dart';
import 'package:lootlo/utils/constants/app_constants.dart';
import 'package:lootlo/widgets/custom_components/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroViewScreen extends StatefulWidget {
  const IntroViewScreen({Key? key}) : super(key: key);

  @override
  State<IntroViewScreen> createState() => _IntroViewScreenState();
}

class _IntroViewScreenState extends State<IntroViewScreen> {
  final controller = PageController();
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    PageViewScreen(
      imagePath:
          'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/3c20bb9e-48d2-44e4-bb2a-abe502b11b50/air-max-270-shoes-s1JpCx.png',
      title: 'Start Journey with Lootlo',
      subtitle: 'Smart, Georgeous and Fashionable Collections',
    ),
    PageViewScreen(
      imagePath:
          'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/3c20bb9e-48d2-44e4-bb2a-abe502b11b50/air-max-270-shoes-s1JpCx.png',
      title: 'Follow latest life trends',
      subtitle: 'Smart, Georgeous and Fashionable Collections',
    ),
    PageViewScreen(
      imagePath:
          'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/3c20bb9e-48d2-44e4-bb2a-abe502b11b50/air-max-270-shoes-s1JpCx.png',
      title: 'Products based on seasonal activities',
      subtitle: 'Smart, Georgeous and Fashionable Collections',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 30,
            left: AppConstants.horizontalPadding,
            right: AppConstants.horizontalPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothPageIndicator(
                effect: WormEffect(
                  dotWidth: 30,
                  dotHeight: 5,
                  activeDotColor: Theme.of(context).primaryColor,
                ),
                onDotClicked: (int index) => controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                ),
                controller: controller,
                count: _screens.length,
              ),
              CustomButton(
                onPressed: _currentIndex == _screens.length - 1
                    ? () => Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.routeName)
                    : () {
                        _currentIndex++;
                        controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                text: _currentIndex == 0 ? 'Get Started' : 'Continue',
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.horizontalPadding,
          vertical: 50,
        ),
        child: PageView(
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          controller: controller,
          children: _screens,
        ),
      ),
    );
  }
}

class PageViewScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const PageViewScreen({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          flex: 5,
          child: Image.network(imagePath),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  wordSpacing: 2,
                  fontWeight: FontWeight.w400,
                  fontSize: 35,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
