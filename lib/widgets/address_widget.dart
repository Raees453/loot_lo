import 'package:flutter/material.dart';
import 'package:lootlo/widgets/utility_widgets.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({Key? key, this.message}) : super(key: key);
  final String? message;

  final String name = 'Ali Wajdan';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: message == null
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                message == null ? name : message! + name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextButton(onPressed: () {}, child: const Text('Edit')),
            ],
          ),
          UtilityWidgets.buildTagBoxWidget('Home'),
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
}
