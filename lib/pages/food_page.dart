import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food/components/my_button.dart';
import 'package:food/models/food.dart';
import 'package:food/models/restaurant.dart';
import 'package:food/pages/cart_page.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};
  FoodPage({super.key, required this.food}) {
    //initialize selected addons to be false
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }
  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
//method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    //close the current food page to go back to menu
    Navigator.pop(context);

    //format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    //add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //scaffold UI
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  //food image
                  widget.food.imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 400,
                ),
                //food name
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.food.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      //food price
                      Text(
                        '\$${widget.food.price.toString()}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //food description
                      Text(widget.food.description,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //addons
                      Text(
                        "Add-ons",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.secondary),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: widget.food.availableAddons.length,
                            itemBuilder: (context, index) {
                              //get individual addons
                              Addon addon = widget.food.availableAddons[index];
                              //return checkbox UI
                              return CheckboxListTile(
                                title: Text(
                                  addon.name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  '\$${addon.price.toString()}',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                value: widget.selectedAddons[addon],
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.selectedAddons[addon] = value!;
                                  });
                                },
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                //button ->add to cart
                MyButton(
                    text: 'Add to Cart',
                    onTap: () {
                      addToCart(widget.food, widget.selectedAddons);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CartPage()));
                    }),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
        //back button
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios_new_rounded)),
            ),
          ),
        ),
      ],
    );
  }
}
