import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    //textstyle
    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
    );
    var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
    );
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //delivery fee
          Column(
            children: [
              Text(
                '\$0.99',
                style: myPrimaryTextStyle,
              ),
              Text(
                'Delivery fee',
                style: mySecondaryTextStyle,
              ),
            ],
          ),
          Column(
            children: [
              Text('15-30 min'),
              Text('Delivery time'),
            ],
          ),

          //delivery time
        ],
      ),
    );
  }
}
