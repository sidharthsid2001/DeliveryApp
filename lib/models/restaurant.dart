import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food/models/cart_item.dart';
import 'package:food/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu

  final List<Food> _menu = [
    //burgers
    Food(
      name: 'Classic Cheeseburger',
      description:
          'juicy beef patty, melted cheese, lettuce, tomato, pickles, onions, ketchup, mustard, on a toasted bun. Delicious simplicity.',
      imagePath: 'lib/images/burgers/cheese_burger.png',
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.99),
        Addon(name: 'Avacado', price: 2.99),
      ],
    ),
    Food(
      name: 'Aloha Cheeseburger',
      description:
          'Grilled beef patty, topped with pineapple, bacon, Swiss cheese, lettuce, tomato, and teriyaki sauce on a bun',
      imagePath: 'lib/images/burgers/aloha_burger.png',
      price: 1.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra bacon strips', price: 1.75),
        Addon(name: 'Bacon', price: 1.99),
        Addon(name: 'Avacado', price: 2.99),
      ],
    ),
    Food(
      name: 'BBQ burger',
      description:
          'Char-grilled beef patty topped with crispy onion rings, cheddar cheese, bacon, BBQ sauce, lettuce, and tomato.',
      imagePath: 'lib/images/burgers/bbq_burger.png',
      price: 1.75,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: ' jalapeños', price: 0.75),
        Addon(name: 'brioche bun', price: 1.50),
        Addon(name: 'fried egg', price: 2.00),
      ],
    ),
    Food(
      name: 'Bluemoon burger',
      description:
          'Angus beef patty with blue cheese crumbles, caramelized onions, arugula, bacon, and garlic aioli on a brioche bun',
      imagePath: 'lib/images/burgers/bluemoon_burger.png',
      price: 0.95,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Avacado', price: 1.50),
        Addon(name: 'truffle fries', price: 2.50),
        Addon(name: 'chipotle mayo', price: 1.00),
      ],
    ),
    Food(
      name: 'Veggie Cheeseburger',
      description:
          'A plant-based patty made from black beans, quinoa, and vegetables, topped with avocado, lettuce, tomato, and vegan aioli',
      imagePath: 'lib/images/burgers/vege_burger.png',
      price: 0.96,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Premium cheese', price: 2.00),
        Addon(name: 'Bacon strips', price: 1.75),
        Addon(name: 'Avacado slice', price: 1.50),
      ],
    ),
    //salads

    Food(
      name: 'Chicken Salad',
      description:
          'Grilled chicken breast slices served on a bed of mixed greens with cherry tomatoes, cucumber, carrots, and balsamic vinaigrette dressing.',
      imagePath: 'lib/images/salads/chicken_salad.png',
      price: 1.00,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'sliced avocado', price: 1.50),
        Addon(name: 'crumbled feta cheese', price: 1.00),
        Addon(name: 'grilled shrimp ', price: 3.00),
      ],
    ),
    Food(
      name: 'Grilled Chicken Salad',
      description:
          'Tender chicken on mixed greens with cherry tomatoes, cucumber, carrots, and balsamic vinaigrette.',
      imagePath: 'lib/images/salads/grilled_chicken_salad.png',
      price: 9.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'sliced avocado', price: 1.50),
        Addon(name: 'crumbled feta cheese', price: 1.00),
        Addon(name: 'grilled shrimp ', price: 3.00),
      ],
    ),
    Food(
      name: 'Rainbow Chopped Salad',
      description:
          'Our Rainbow Chopped Salad bursts with vibrant colors and flavors, featuring a medley of fresh vegetables, crunchy nuts, and tangy dressing.',
      imagePath: 'lib/images/salads/rainbow_chopped_salad.png',
      price: 10.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'grilled chicken', price: 2.00),
        Addon(name: 'avocado slices', price: 1.50),
        Addon(name: 'goat cheese crumbles ', price: 1.75),
      ],
    ),
    Food(
      name: 'Salmon Nicois Salad',
      description:
          'Indulge in our Salmon Niçoise Salad, boasting succulent grilled salmon atop crisp greens, accompanied by boiled eggs, olives, potatoes, and tangy vinaigrette.',
      imagePath: 'lib/images/salads/salmon_nicois_salad.png',
      price: 12.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'cherry tomatoes', price: 1.50),
        Addon(name: ' capers', price: 1.00),
        Addon(name: 'seared ahi tuna', price: 3.00),
      ],
    ),
    Food(
      name: 'Savory Fruit Salad',
      description:
          'ISavor our Savory Fruit Salad, a delightful blend of fresh fruits, crisp veggies, and savory toppings, drizzled with a zesty dressing.',
      imagePath: 'lib/images/salads/savory_fruit_salad.png',
      price: 8.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'grilled chicken strips', price: 2.00),
        Addon(name: 'feta cheese crumbles', price: 1.50),
        Addon(name: 'candied walnuts', price: 1.75),
      ],
    ),

    //sides
    Food(
      name: 'Garlic Bread Side',
      description:
          'ISavor our Savory Fruit Salad, a delightful blend of fresh fruits, crisp veggies, and savory toppings, drizzled with a zesty dressing.',
      imagePath: 'lib/images/sides/garlic_bread_side.png',
      price: 3.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'mozzarella cheese', price: 1.50),
        Addon(name: ' marinara sauce', price: 1.00),
        Addon(name: 'parmesan-crusted', price: 2.00),
      ],
    ),
    Food(
      name: 'Loaded Fries Side',
      description:
          'Our Loaded Fries Side: Crispy fries piled high with melted cheddar cheese, crispy bacon bits, and tangy sour cream.',
      imagePath: 'lib/images/sides/loadedfries_side.png',
      price: 5.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'sliced jalapeños', price: 0.75),
        Addon(name: 'diced green onions', price: 0.50),
        Addon(name: ' chili con carne', price: 2.00),
      ],
    ),
    Food(
      name: 'Mac and Cheese Side',
      description:
          'Indulge in our Mac and Cheese Side—a creamy blend of tender pasta smothered in rich, gooey cheese sauce.',
      imagePath: 'lib/images/sides/mac_side.png',
      price: 4.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'crispy bacon crumbles', price: 1.50),
        Addon(name: 'diced jalapeñose', price: 0.75),
        Addon(name: 'truffle-infused', price: 2.50),
      ],
    ),
    //desserts
    Food(
      name: 'Caramel Toffee Icecream',
      description:
          'Satisfy your sweet tooth with our Caramel Toffee Ice Cream—creamy vanilla base swirled with ribbons of caramel and crunchy toffee bits.',
      imagePath: 'lib/images/desserts/caramel_topped_icecream.png',
      price: 6.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'whipped cream topping', price: 0.75),
        Addon(name: 'chocolate sprinkles', price: 0.50),
        Addon(name: 'waffle cone', price: 1.00),
      ],
    ),
    Food(
      name: 'Chocolate Hazelnut Icecream',
      description:
          'Indulge in our Chocolate Hazelnut Ice Cream—decadent chocolate base infused with creamy hazelnut swirls and crunchy hazelnut pieces.',
      imagePath: 'lib/images/desserts/chocolate_hazelnut.png',
      price: 7.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'chocolate sauce drizzles', price: 0.75),
        Addon(name: 'chopped roasted almonds', price: 1.75),
        Addon(name: 'double scoop', price: 2.50),
      ],
    ),
    Food(
      name: 'French Macrons',
      description:
          'Enjoy our French Macarons—delicate almond meringue cookies filled with luscious ganache or buttercream in assorted flavors.',
      imagePath: 'lib/images/desserts/macrons.png',
      price: 2.50,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'sprinkle of edible glitter', price: 0.50),
        Addon(name: 'custom message decoration', price: 1.00),
        Addon(name: ' gift box packaging', price: 3.00),
      ],
    ),
    //drinks
    Food(
      name: 'Chocolate Shake',
      description:
          'Savor our Chocolate Shake—creamy, indulgent, and rich in flavor, blended to perfection with premium chocolate and topped with whipped cream.',
      imagePath: 'lib/images/drinks/chocolate_shake.png',
      price: 4.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: ' chocolate syrup drizzle', price: 0.75),
        Addon(name: 'chocolate shavings', price: 0.50),
        Addon(name: ' large size', price: 1.50),
      ],
    ),
    Food(
      name: 'Mint Lime',
      description:
          'Quench your thirst with our Mint Lime—a refreshing drink infused with zesty lime juice and cooling mint leaves.',
      imagePath: 'lib/images/drinks/mint_lime.png',
      price: 3.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: ' splash of soda water', price: 0.75),
        Addon(name: 'a lime wedge garnish', price: 0.25),
        Addon(name: 'double serving', price: 1.50),
      ],
    ),
    Food(
      name: 'Tequila Sunrise',
      description:
          'Sip on our Tequila Sunrise—a vibrant cocktail featuring tequila, orange juice, and grenadine, beautifully layered for a stunning sunrise effect.',
      imagePath: 'lib/images/drinks/tequila_sunrise_cocktail.png',
      price: 8.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'maraschino cherry garnish', price: 0.75),
        Addon(name: 'orange slice garnish', price: 0.50),
        Addon(name: 'premium tequila', price: 3.00),
      ],
    ),
  ];
  //user cart
  final List<CartItem> _cart = [];
  //delivery address(which user can change/update)
  String _deliveryAddress = '99 Holywood Blv';
  //G E T T E R S
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  //O P E R A T I O N S

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddon) {
    //see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;
      //check if the list of selected addons are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddon);

      return isSameFood && isSameAddons;
    });
    //if item already exists,increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    //othewise,add a new cart item to the cart
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddon));
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total price of cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //get total  number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //update delivery address
  void updateDeliveyAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  //H E L PE R S
  //generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    //format the data to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("-------------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x (${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("Addons: ${formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("-------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.write('Delivering to : ${_deliveryAddress}');
    return receipt.toString();
  }

  //format double value  into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  //format list of addons into a string summary
  String formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(",");
  }
}
