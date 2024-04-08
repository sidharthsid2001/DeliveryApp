import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    TextEditingController textControllerAddress1 = TextEditingController();
    TextEditingController textControllerAddress2 = TextEditingController();
    TextEditingController textControllerState = TextEditingController();
    TextEditingController textControllerPostalCode = TextEditingController();
    TextEditingController textControllerCity = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Your Location'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: textControllerAddress1,
              decoration: InputDecoration(hintText: 'Address Line 1'),
            ),
            TextField(
              controller: textControllerAddress2,
              decoration:
                  InputDecoration(hintText: 'Address Line 2 (Optional)'),
            ),
            TextField(
              controller: textControllerCity,
              decoration: InputDecoration(hintText: 'City'),
            ),
            TextField(
              controller: textControllerState,
              decoration: InputDecoration(hintText: 'State/Province'),
            ),
            TextField(
              controller: textControllerPostalCode,
              decoration: InputDecoration(hintText: 'Postal Code (Optional)'),
            ),
          ],
        ),
        actions: [
          // Cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          // Save button
          MaterialButton(
            onPressed: () {
              // Assemble the address from the input fields
              String addressLine1 = textControllerAddress1.text;
              String addressLine2 = textControllerAddress2.text;
              String city = textControllerCity.text;
              String state = textControllerState.text;
              String postalCode = textControllerPostalCode.text;

              // Combine the address components
              String address = '$addressLine1';
              if (addressLine2.isNotEmpty) {
                address += ', $addressLine2';
              }
              address += ', $city, $state';
              if (postalCode.isNotEmpty) {
                address += ', $postalCode';
              }

              // Update delivery address
              context.read<Restaurant>().updateDeliveyAddress(address);

              // Close the dialog
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliver now',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                //address
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) => SizedBox(
                    child: Text(
                      restaurant.deliveryAddress,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                //drop down menu
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }
}
