import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant_model.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();
  MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Your Location"),
              content: TextField(
                controller: textEditingController,
                decoration: InputDecoration(hintText: "Search address..."),
              ),
              actionsAlignment: MainAxisAlignment.spaceAround,
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    textEditingController.clear();
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    String? newAddress = textEditingController.text;
                    context
                        .read<RestaurantModel>()
                        .updateDeliveryAddress(newAddress);
                    Navigator.of(context).pop();
                    textEditingController.clear();
                  },
                  child: const Text("Save"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver now",
            style: TextStyle(color: colorScheme.primary),
          ),
          GestureDetector(
            onTap: () {
              openLocationSearchBox(context);
            },
            child: Consumer<RestaurantModel>(builder: (context, value, child) {
              return Row(
                children: [
                  Text(
                    value.deliveryAddress!,
                    style: TextStyle(color: colorScheme.inversePrimary),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: colorScheme.inversePrimary,
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
