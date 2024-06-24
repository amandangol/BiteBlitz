import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'package:food_delivery_app/models/restaurant_model.dart';
import 'package:food_delivery_app/screens/cart_screen.dart';
import 'package:food_delivery_app/utils/custom_scaffold_messenger.dart';
import 'package:food_delivery_app/widgets/my_button.dart';
import 'package:provider/provider.dart';

class FoodScreen extends StatefulWidget {
  final Map<AddOn, bool> selectedAddons = {};
  final Food food;
  FoodScreen({super.key, required this.food}) {
    for (AddOn addOn in food.availableAddons) {
      selectedAddons[addOn] = false;
    }
  }

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
//method to add to cart

  void addToCart(Food food, Map<AddOn, bool> selectedAddons) {
    //format the selected addons
    List<AddOn> currentlySelectedAddons = [];
    for (AddOn addOn in widget.food.availableAddons) {
      if (widget.selectedAddons[addOn] == true) {
        currentlySelectedAddons.add(addOn);
      }
    }
    //add to cart
    context.read<RestaurantModel>().addToCart(food, currentlySelectedAddons);
    // Show a snackbar with undo action

    // Navigator.pop(context);
    _showSnackBar();
  }

  void _showSnackBar() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        CustomScaffoldMessenger.showSnackBar(context, "Item added to cart", () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartScreen()));
        }, "View Cart", backgroundColor: Colors.green);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        SafeArea(
          child: Scaffold(
            backgroundColor: colorScheme.surface,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  widget.food.imagePath,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.food.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Rs. ${widget.food.price}",
                        style: TextStyle(color: colorScheme.primary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.food.description,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: colorScheme.secondary,
                      ),
                      Text(
                        "Add-ons",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.inversePrimary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: colorScheme.secondary),
                            borderRadius: BorderRadius.circular(8)),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            final addOns = widget.food.availableAddons[index];
                            return CheckboxListTile(
                              title: Text(addOns.name),
                              checkColor: colorScheme.secondary,
                              subtitle: Text(
                                "Rs. ${addOns.price}",
                                style: TextStyle(color: colorScheme.primary),
                              ),
                              value: widget.selectedAddons[addOns],
                              onChanged: (value) {
                                setState(() {
                                  widget.selectedAddons[addOns] = value!;
                                });
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                CustomButton(
                  text: "Add to cart",
                  onTap: () {
                    addToCart(widget.food, widget.selectedAddons);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Opacity(
            opacity: 0.4,
            child: Container(
              margin: const EdgeInsets.only(left: 20, top: 10),
              decoration: BoxDecoration(
                  color: colorScheme.secondary, shape: BoxShape.circle),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
