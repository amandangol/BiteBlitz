import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant_model.dart';
import 'package:food_delivery_app/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class MySliverAppbar extends StatelessWidget {
  final Widget? child;
  final Widget? title;
  const MySliverAppbar({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SliverAppBar(
      collapsedHeight: 120,
      expandedHeight: 340,
      floating: false,
      backgroundColor: colorScheme.surface,
      pinned: true,
      title: const Text(
        "BiteBlitz",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
      centerTitle: true,
      actions: [
        Consumer<RestaurantModel>(builder: (context, cartItem, child) {
          return Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartScreen()));
                  },
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    size: 24,
                  )),
              Positioned(
                right: 3,
                child: cartItem.cart.isNotEmpty
                    ? Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 18,
                          minHeight: 18,
                        ),
                        child: Text(
                          cartItem.cart.length.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Container(),
              ),
            ],
          );
        })
      ],
      foregroundColor: colorScheme.inversePrimary,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        expandedTitleScale: 1,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
      ),
    );
  }
}
