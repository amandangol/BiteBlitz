import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/models/restaurant_model.dart';
import 'package:food_delivery_app/widgets/my_quantity_selector.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MyCartTile extends StatelessWidget {
  CartItem cartItem;
  MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Consumer<RestaurantModel>(builder: (context, restaurant, child) {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: colorScheme.tertiary,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  cartItem.food.imagePath,
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItem.food.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Rs. ${cartItem.food.price}",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: colorScheme.primary),
                    )
                  ],
                ),
                const Spacer(),
                QuantitySelector(
                  food: cartItem.food,
                  quantity: cartItem.quantity,
                  onDecrement: () {
                    restaurant.removeFromCart(cartItem);
                  },
                  onIncrement: () {
                    restaurant.addToCart(
                        cartItem.food, cartItem.selectedAddons);
                  },
                )
              ],
            ),
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                scrollDirection: Axis.horizontal,
                children: cartItem.selectedAddons
                    .map((addon) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FilterChip(
                            shape: StadiumBorder(
                                side: BorderSide(color: colorScheme.primary)),
                            backgroundColor: colorScheme.secondary,
                            labelStyle:
                                TextStyle(color: colorScheme.inversePrimary),
                            label: Row(
                              children: [
                                Text(addon.name),
                                Text(
                                  " (Rs ${addon.price})",
                                  // style: TextStyle(color: colorScheme.primary),
                                ),
                              ],
                            ),
                            onSelected: (value) {},
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
