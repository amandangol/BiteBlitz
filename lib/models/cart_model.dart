import 'package:food_delivery_app/models/food_model.dart';

class CartItem {
  Food food;
  List<AddOn> selectedAddons;
  int quantity;
  CartItem({
    required this.food,
    required this.selectedAddons,
    this.quantity = 1,
  });

  double get totalPrice {
    double addOnsPrice =
        selectedAddons.fold(0, (sum, addOn) => sum + addOn.price);
    return (food.price + addOnsPrice) * quantity;
  }
}
