import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Ali Wajdan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextButton(onPressed: () {}, child: const Text('Edit')),
            ],
          ),
          buildCategoryBox(context, 'Home'),
          const SizedBox(height: 10),
          const Text(
            'Khalid Bin Waleed Hall, Anarkali Bazar Old Campus Punjab University, Lahore',
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 10),
          const Text(
            '(+92) 304-1779940',
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget buildCategoryBox(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
