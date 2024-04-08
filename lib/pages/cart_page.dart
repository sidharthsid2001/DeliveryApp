import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:food/components/my_button.dart';
import 'package:food/components/my_cart_tile.dart';
import 'package:food/models/restaurant.dart';
import 'package:food/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      //cart
      final userCart = restaurant.cart;
      //scaffold UI
      return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            //clear cart button
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text(
                                'Are you sure you want to clear the cart?'),
                            actions: [
                              //cancel button
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel')),
                              //clear cart button
                              TextButton(
                                  onPressed: () {
                                    restaurant.clearCart();
                                    Navigator.pop(context);
                                  },
                                  child: Text('Yes')),
                            ],
                          ));
                },
                icon: Icon(Icons.delete)),
          ],
        ),
        body: Column(
          children: [
            //list of cart
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? Expanded(
                          child: Center(
                              child: Text('Cart is empty..',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ))))
                      : Expanded(
                          child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                //get individual cart item
                                final cartItem = userCart[index];
                                //return cart tile UI
                                return MyCartTile(cartItem: cartItem);
                              }),
                        ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            userCart.isEmpty
                ? const SizedBox()
                : Container(
                    padding: EdgeInsets.all(30),
                    height: 140,
                    width: 340,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Cart Summary',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Total Price: \$${restaurant.getTotalPrice()}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                      ],
                    ),
                  ),

            const SizedBox(
              height: 20,
            ),
            //button to pay
            MyButton(
                text: 'Go to Checkout',
                onTap: () {
                  userCart.isEmpty
                      ? {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('Cart is empty..'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Ok'))
                                    ],
                                  ))
                        }
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentPage()));
                }),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      );
    });
  }
}
