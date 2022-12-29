import 'package:flutter/material.dart';
import 'package:lootlo/utils/constants/app_constants.dart';
import 'package:lootlo/widgets/address_widget.dart';
import 'package:lootlo/widgets/custom_components/custom_app_bar.dart';

class AddressBookScreen extends StatelessWidget {
  static const String routeName = '/address-book';

  const AddressBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.appBackgroundColor,
      appBar: CustomAppBar.getAppBar(context, 'My Address'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.fullScreenPadding),
        child: Column(
          children: [
            ListView.separated(
              itemCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (_, index) => const AddressWidget(),
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: const Center(
                child: Text(
                  'Add Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
