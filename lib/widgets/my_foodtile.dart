import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_model.dart';

class MyFoodTile extends StatelessWidget {
  final VoidCallback? onTap;
  final Food food;
  const MyFoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Rs. ${food.price}",
                        style: TextStyle(color: colorScheme.primary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        food.description,
                        style: TextStyle(
                            color: colorScheme.inversePrimary, fontSize: 16),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    food.imagePath,
                    height: 120,
                    width: 120,
                  ),
                )
              ],
            ),
          ),
        ),
        Divider(
          color: colorScheme.tertiary,
          indent: 20,
          endIndent: 20,
        )
      ],
    );
  }
}
