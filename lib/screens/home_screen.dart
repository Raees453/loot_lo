import 'package:flutter/material.dart';
import 'package:lootlo/screens/account/account_screen.dart';
import 'package:lootlo/screens/orders/cart_screen.dart';
import 'package:lootlo/screens/product/fav_products_screen.dart';
import 'package:lootlo/screens/product/product_notifications_screen.dart';
import 'package:lootlo/screens/product/products_screen.dart';
import 'package:lootlo/utils/constants/app_constants.dart';
import 'package:lootlo/widgets/custom_components/custom_app_bar.dart';
import 'package:lootlo/widgets/custom_components/custom_drawer.dart';

import '../services/product_search_delegate.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final items = {
    'Home': Icons.home,
    'Favourites': Icons.favorite_border,
    'Cart': Icons.shopping_cart,
    'Account': Icons.account_circle,
  };

  final _titles = ['Home', 'Favourites', 'Cart', 'Account'];

  final screens = [
    ProductsScreen(),
    FavProductsScreen(),
    ProductNotificationsScreen(),
    const AccountScreen(),
    CartScreen(),
  ];

  int currentIndex = 0;
  String appBarTitle = 'Home';
  bool _isFirstRebuild = true;

  @override
  Widget build(BuildContext context) {
    int? startIndex = ModalRoute.of(context)?.settings.arguments as int?;
    if (startIndex != null && _isFirstRebuild) {
      currentIndex = startIndex;
      appBarTitle = _titles[startIndex];
      _isFirstRebuild = false;
    }

    return Scaffold(
      backgroundColor: AppConstants.appBackgroundColor,
      appBar: CustomAppBar.getAppBar(context, appBarTitle),
      drawer: const CustomDrawer(),
      bottomNavigationBar: buildBottomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            currentIndex == 4 ? Colors.white : Theme.of(context).primaryColor,
        child: Icon(
          Icons.shopping_cart,
          color:
              currentIndex != 4 ? Colors.white : Theme.of(context).primaryColor,
        ),
        onPressed: () {
          if (currentIndex != 4) {
            appBarTitle = 'Cart';
            setState(() => currentIndex = 4);
          }
        },
      ),
      body: screens.elementAt(currentIndex),
    );
  }

  Widget buildBottomAppBar() {
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          SizedBox(
            height: 60,
            child: CustomPaint(
              painter: RPSCustomPainter(),
            ),
          ),
          Row(
            children: [
              buildAppBarIcon(Icons.home, 0, 'Home'),
              buildAppBarIcon(Icons.favorite_border, 1, 'Favourites'),
              const Spacer(),
              buildAppBarIcon(
                  Icons.notifications_none_outlined, 2, 'Notifications'),
              buildAppBarIcon(Icons.person_outline_outlined, 3, 'Account'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAppBarIcon(IconData icon, int indexNum, String appBarTitle) {
    return Expanded(
      child: IconButton(
        onPressed: () {
          if (currentIndex != indexNum) {
            this.appBarTitle = appBarTitle;
            setState(() => currentIndex = indexNum);
          }
        },
        icon: Icon(
          icon,
          color: currentIndex == indexNum
              ? Theme.of(context).primaryColor
              : Colors.grey,
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.grey.shade100
      ..strokeWidth = 150;

    Path path0 = Path();
    path0.moveTo(0, -size.height * 0.3);

    path0.quadraticBezierTo(
      size.width * 0.05,
      0,
      size.width * 0.4,
      size.height * 0.1,
    );

    path0.arcToPoint(
      Offset(size.width * 0.6, size.height * 0.1),
      radius: const Radius.circular(5),
      clockwise: false,
    );

    path0.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.1,
      size.width,
      -size.height * 0.3,
    );

    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SearchButtonBar extends StatelessWidget {
  const SearchButtonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showSearch(
        // query: '',
        context: context,
        delegate: ProductSearchDelegate(),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.all(AppConstants.horizontalPadding),
        child: Row(
          children: const [
            Icon(
              Icons.search,
              size: 30,
            ),
            SizedBox(width: 20),
            Text(
              'Looking for...',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
