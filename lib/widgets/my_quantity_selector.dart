import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_model.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector(
      {super.key,
      required this.quantity,
      required this.food,
      required this.onDecrement,
      required this.onIncrement});

  final int quantity;
  final Food food;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
          color: colorScheme.surface, borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          IconButton(
            onPressed: onDecrement,
            icon: quantity == 1
                ? Icon(
                    Icons.delete,
                    size: 20,
                    color: colorScheme.inversePrimary,
                  )
                : Icon(
                    Icons.remove,
                    size: 20,
                    color: colorScheme.primary,
                  ),
          ),
          Text(
            quantity.toString(),
          ),
          IconButton(
            onPressed: onIncrement,
            icon: Icon(
              Icons.add,
              size: 20,
              color: colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}
