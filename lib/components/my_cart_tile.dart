import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food/components/my_quantity_selector.dart';
import 'package:food/models/cart_item.dart';
import 'package:food/models/food.dart';
import 'package:food/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),

                  //name and price
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Column(
                      children: [
                        SizedBox(width: 130, child: Text(cartItem.food.name)),
                        Text(
                          cartItem.food.price.toString(),
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  //increment or decrement quantity
                  QuantitySelector(
                    quantity: cartItem.quantity,
                    food: cartItem.food,
                    onIncrement: () {
                      restaurant.addToCart(
                          cartItem.food, cartItem.selectedAddons);
                    },
                    onDecrement: () {
                      restaurant.removeFromCart(cartItem);
                    },
                  ),
                ],
              ),
            ),
            // addons
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                children: cartItem.selectedAddons
                    .map((addon) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FilterChip(
                            label: Row(
                              children: [
                                //addon name
                                Text(addon.name),
                                // addon price
                                Text('(\$' + addon.price.toString() + ')'),
                              ],
                            ),
                            shape: StadiumBorder(
                                side: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                            onSelected: (value) {},
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            labelStyle: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontSize: 12),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
