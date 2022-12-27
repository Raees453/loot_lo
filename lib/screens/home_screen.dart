import 'package:flutter/material.dart';
import 'package:lootlo/screens/account/account_screen.dart';
import 'package:lootlo/screens/orders/cart_screen.dart';
import 'package:lootlo/screens/product/fav_products_screen.dart';
import 'package:lootlo/screens/product/products_screen.dart';
import 'package:lootlo/services/product_search_delegate.dart';
import 'package:lootlo/utils/constants/app_constants.dart';
import 'package:lootlo/widgets/custom_components/custom_app_bar.dart';
import 'package:lootlo/widgets/custom_components/custom_drawer.dart';

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

  final _titles = [
    'Home',
    'Favourites',
    'Cart',
    'Account',
  ];

  final screens = [
    const ProductsScreen(),
    FavProductsScreen(),
    CartScreen(),
    const AccountScreen(),
  ];

  int currentIndex = 0;
  String appBarTitle = 'Home';
  bool _isFirstRebuild = true;

  @override
  Widget build(BuildContext context) {
    print('Home Screen Build!!!!');
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
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        currentIndex: currentIndex,
        onTap: (int index) => setState(() {
          currentIndex = index;
          appBarTitle = _titles[index];
        }),
        items: items.entries
            .map(
              (e) => BottomNavigationBarItem(
                icon: Icon(e.value),
                label: '',
                tooltip: e.key,
              ),
            )
            .toList(),
      ),
      body: screens.elementAt(currentIndex),
    );
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
