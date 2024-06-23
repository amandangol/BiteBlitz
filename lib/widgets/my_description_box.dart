import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colorScheme.secondary),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("\$0.99",
                  style: TextStyle(color: colorScheme.inversePrimary)),
              Text("Delivery Fee",
                  style: TextStyle(color: colorScheme.primary)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "15-30 min",
                style: TextStyle(color: colorScheme.inversePrimary),
              ),
              Text(
                "Delivery time",
                style: TextStyle(color: colorScheme.primary),
              ),
            ],
          )
        ],
      ),
    );
  }
}
