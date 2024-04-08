import 'package:flutter/material.dart';
import 'package:food/pages/cart_page.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        expandedHeight: 340,
        collapsedHeight: 120,
        floating: false,
        pinned: true, //appbar is pinned
        actions: [
          IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              }),
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Sunset Diner'),
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: child,
          ),
          title: title,
          centerTitle: true,
          titlePadding: EdgeInsets.only(left: 0, right: 0, top: 0),
          expandedTitleScale: 1,
        ));
  }
}
