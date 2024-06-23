import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant_model.dart';
import 'package:food_delivery_app/screens/payment_screen.dart';
import 'package:food_delivery_app/widgets/my_button.dart';
import 'package:food_delivery_app/widgets/my_cart_tile.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Consumer<RestaurantModel>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;
        final totalAmount = restaurant.getTotalPrice();

        return Scaffold(
          backgroundColor: colorScheme.surface,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: colorScheme.inversePrimary,
            title: const Text("Cart"),
            centerTitle: true,
            actions: [
              restaurant.cart.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text(
                                "Are you sure you want to clear the cart?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  restaurant.clearCart();
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: colorScheme.inversePrimary),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.delete_forever,
                      ),
                    )
                  : Container()
            ],
          ),
          body: Column(
            children: [
              restaurant.cart.isEmpty
                  ? Expanded(
                      child: Center(
                        child: Text(
                          "You haven't added anything\nto the cart",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: colorScheme.inversePrimary, fontSize: 18),
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index) {
                          final cartItem = restaurant.cart[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10),
                            child: MyCartTile(
                              cartItem: cartItem,
                            ),
                          );
                        },
                      ),
                    ),
              restaurant.cart.isEmpty
                  ? Container()
                  : CustomButton(
                      text:
                          "Go to Checkout (Rs.${totalAmount.toStringAsFixed(2)})",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaymentScreen()));
                      },
                    ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}
