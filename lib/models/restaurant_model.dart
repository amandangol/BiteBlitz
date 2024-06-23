import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'package:intl/intl.dart';

class RestaurantModel extends ChangeNotifier {
  final List<Food> _menu = [
    // Burgers
    Food(
      name: "Classic Cheeseburger",
      price: 450,
      description:
          "A juicy ham patty with melted cheddar, lettuce, tomato and a hint of onion and pickle",
      imagePath: "assets/images/burger1.png",
      category: FoodCategory.burgers,
      availableAddons: [
        AddOn(name: "Extra Cheese", price: 100),
        AddOn(name: "Bacon", price: 150),
        AddOn(name: "Spices", price: 50),
      ],
    ),
    Food(
      name: "BBQ Bacon Burger",
      price: 500,
      description:
          "A burger with BBQ sauce, bacon, cheddar cheese, and crispy onion rings",
      imagePath: "assets/images/burger2.png",
      category: FoodCategory.burgers,
      availableAddons: [
        AddOn(name: "Extra Bacon", price: 150),
        AddOn(name: "BBQ Sauce", price: 50),
        AddOn(name: "Jalapenos", price: 50),
      ],
    ),
    Food(
      name: "Veggie Burger",
      price: 400,
      description: "A wholesome veggie patty with lettuce, tomato, and avocado",
      imagePath: "assets/images/burger1.png",
      category: FoodCategory.burgers,
      availableAddons: [
        AddOn(name: "Avocado", price: 100),
        AddOn(name: "Grilled Mushrooms", price: 80),
        AddOn(name: "Extra Lettuce", price: 20),
      ],
    ),
    Food(
      name: "Spicy Chicken Burger",
      price: 450,
      description:
          "A spicy chicken patty with pepper jack cheese, jalapenos, and chipotle mayo",
      imagePath: "assets/images/burger2.png",
      category: FoodCategory.burgers,
      availableAddons: [
        AddOn(name: "Extra Jalapenos", price: 50),
        AddOn(name: "Chipotle Mayo", price: 30),
        AddOn(name: "Pepper Jack Cheese", price: 100),
      ],
    ),
    Food(
      name: "Mushroom Swiss Burger",
      price: 470,
      description:
          "A beef patty with swiss cheese, sautéed mushrooms, and garlic aioli",
      imagePath: "assets/images/burger1.png",
      category: FoodCategory.burgers,
      availableAddons: [
        AddOn(name: "Extra Swiss Cheese", price: 100),
        AddOn(name: "Extra Mushrooms", price: 80),
        AddOn(name: "Garlic Aioli", price: 40),
      ],
    ),

    // Salads
    Food(
      name: "Caesar Salad",
      price: 300,
      description:
          "Crisp romaine lettuce with Caesar dressing, croutons, and parmesan cheese",
      imagePath: "assets/images/salad1.png",
      category: FoodCategory.salads,
      availableAddons: [
        AddOn(name: "Grilled Chicken", price: 100),
        AddOn(name: "Bacon Bits", price: 50),
        AddOn(name: "Extra Parmesan", price: 30),
      ],
    ),
    Food(
      name: "Greek Salad",
      price: 320,
      description:
          "Mixed greens with feta cheese, olives, cucumber, and Greek dressing",
      imagePath: "assets/images/salad2.png",
      category: FoodCategory.salads,
      availableAddons: [
        AddOn(name: "Extra Feta", price: 50),
        AddOn(name: "Grilled Shrimp", price: 150),
        AddOn(name: "Hummus", price: 50),
      ],
    ),
    Food(
      name: "Cobb Salad",
      price: 350,
      description:
          "A hearty salad with mixed greens, bacon, avocado, boiled eggs, and blue cheese",
      imagePath: "assets/images/salad1.png",
      category: FoodCategory.salads,
      availableAddons: [
        AddOn(name: "Extra Avocado", price: 100),
        AddOn(name: "Grilled Chicken", price: 100),
        AddOn(name: "Boiled Eggs", price: 50),
      ],
    ),
    Food(
      name: "Garden Salad",
      price: 280,
      description:
          "A fresh mix of greens, tomatoes, cucumbers, and carrots with your choice of dressing",
      imagePath: "assets/images/salad2.png",
      category: FoodCategory.salads,
      availableAddons: [
        AddOn(name: "Extra Tomatoes", price: 20),
        AddOn(name: "Grilled Chicken", price: 100),
        AddOn(name: "Croutons", price: 20),
      ],
    ),
    Food(
      name: "Spinach & Strawberry Salad",
      price: 340,
      description:
          "Baby spinach with fresh strawberries, goat cheese, and a balsamic vinaigrette",
      imagePath: "assets/images/salad1.png",
      category: FoodCategory.salads,
      availableAddons: [
        AddOn(name: "Extra Strawberries", price: 50),
        AddOn(name: "Grilled Chicken", price: 100),
        AddOn(name: "Goat Cheese", price: 70),
      ],
    ),

    // Pizzas
    Food(
      name: "Margherita Pizza",
      price: 500,
      description:
          "Classic pizza with tomato sauce, fresh mozzarella, and basil",
      imagePath: "assets/images/pizza1.png",
      category: FoodCategory.pizzas,
      availableAddons: [
        AddOn(name: "Extra Mozzarella", price: 100),
        AddOn(name: "Pepperoni", price: 150),
        AddOn(name: "Olives", price: 50),
      ],
    ),
    Food(
      name: "Pepperoni Pizza",
      price: 550,
      description:
          "A fan-favorite with tomato sauce, mozzarella, and plenty of pepperoni",
      imagePath: "assets/images/pizza2.png",
      category: FoodCategory.pizzas,
      availableAddons: [
        AddOn(name: "Extra Pepperoni", price: 150),
        AddOn(name: "Jalapenos", price: 50),
        AddOn(name: "Mushrooms", price: 80),
      ],
    ),
    Food(
      name: "BBQ Chicken Pizza",
      price: 600,
      description: "Tangy BBQ sauce, grilled chicken, red onions, and cilantro",
      imagePath: "assets/images/pizza1.png",
      category: FoodCategory.pizzas,
      availableAddons: [
        AddOn(name: "Extra Chicken", price: 150),
        AddOn(name: "Pineapple", price: 70),
        AddOn(name: "Cheddar Cheese", price: 100),
      ],
    ),
    Food(
      name: "Vegetarian Pizza",
      price: 520,
      description:
          "Tomato sauce, mozzarella, bell peppers, onions, olives, and mushrooms",
      imagePath: "assets/images/pizza2.png",
      category: FoodCategory.pizzas,
      availableAddons: [
        AddOn(name: "Extra Mozzarella", price: 100),
        AddOn(name: "Spinach", price: 50),
        AddOn(name: "Artichokes", price: 80),
      ],
    ),
    Food(
      name: "Hawaiian Pizza",
      price: 570,
      description: "Tomato sauce, mozzarella, ham, and pineapple",
      imagePath: "assets/images/pizza1.png",
      category: FoodCategory.pizzas,
      availableAddons: [
        AddOn(name: "Extra Pineapple", price: 70),
        AddOn(name: "Extra Ham", price: 150),
        AddOn(name: "Bacon", price: 150),
      ],
    ),

    // Desserts
    Food(
      name: "Chocolate Cake",
      price: 300,
      description:
          "Rich and moist chocolate cake with a velvety chocolate ganache",
      imagePath: "assets/images/dessert1.png",
      category: FoodCategory.desserts,
      availableAddons: [
        AddOn(name: "Vanilla Ice Cream", price: 100),
        AddOn(name: "Whipped Cream", price: 50),
        AddOn(name: "Chocolate Chips", price: 50),
      ],
    ),
    Food(
      name: "Cheesecake",
      price: 320,
      description:
          "Creamy cheesecake with a graham cracker crust and strawberry topping",
      imagePath: "assets/images/dessert2.png",
      category: FoodCategory.desserts,
      availableAddons: [
        AddOn(name: "Extra Strawberry", price: 50),
        AddOn(name: "Whipped Cream", price: 50),
        AddOn(name: "Caramel Sauce", price: 50),
      ],
    ),
    Food(
      name: "Apple Pie",
      price: 350,
      description:
          "Classic apple pie with a flaky crust and cinnamon-spiced apples",
      imagePath: "assets/images/dessert1.png",
      category: FoodCategory.desserts,
      availableAddons: [
        AddOn(name: "Vanilla Ice Cream", price: 100),
        AddOn(name: "Caramel Sauce", price: 50),
        AddOn(name: "Whipped Cream", price: 50),
      ],
    ),
    Food(
      name: "Brownie",
      price: 250,
      description: "Decadent chocolate brownie with a gooey center",
      imagePath: "assets/images/dessert2.png",
      category: FoodCategory.desserts,
      availableAddons: [
        AddOn(name: "Vanilla Ice Cream", price: 100),
        AddOn(name: "Nuts", price: 50),
        AddOn(name: "Chocolate Chips", price: 50),
      ],
    ),
    Food(
      name: "Ice Cream Sundae",
      price: 280,
      description: "Three scoops of ice cream with your choice of toppings",
      imagePath: "assets/images/dessert1.png",
      category: FoodCategory.desserts,
      availableAddons: [
        AddOn(name: "Chocolate Syrup", price: 50),
        AddOn(name: "Sprinkles", price: 20),
        AddOn(name: "Cherries", price: 30),
      ],
    ),

    // Drinks
    Food(
      name: "Coca-Cola",
      price: 100,
      description: "Refreshing cold Coca-Cola",
      imagePath: "assets/images/drinks2.png",
      category: FoodCategory.drinks,
      availableAddons: [
        AddOn(name: "Extra Ice", price: 10),
        AddOn(name: "Lemon Slice", price: 20),
      ],
    ),
    Food(
      name: "Orange Juice",
      price: 150,
      description: "Freshly squeezed orange juice",
      imagePath: "assets/images/drinks1.png",
      category: FoodCategory.drinks,
      availableAddons: [
        AddOn(name: "Ice", price: 10),
        AddOn(name: "Mint Leaves", price: 20),
      ],
    ),
    Food(
      name: "Latte",
      price: 200,
      description: "Creamy latte made with fresh espresso and steamed milk",
      imagePath: "assets/images/drinks1.png",
      category: FoodCategory.drinks,
      availableAddons: [
        AddOn(name: "Extra Shot", price: 50),
        AddOn(name: "Vanilla Syrup", price: 30),
        AddOn(name: "Caramel Syrup", price: 30),
      ],
    ),
    Food(
      name: "Smoothie",
      price: 180,
      description: "Blended fruit smoothie with your choice of fruits",
      imagePath: "assets/images/drinks1.png",
      category: FoodCategory.drinks,
      availableAddons: [
        AddOn(name: "Protein Powder", price: 50),
        AddOn(name: "Chia Seeds", price: 30),
        AddOn(name: "Honey", price: 20),
      ],
    ),
    Food(
      name: "Water",
      price: 50,
      description: "Bottled water",
      imagePath: "assets/images/drinks2.png",
      category: FoodCategory.drinks,
      availableAddons: [
        AddOn(name: "Ice", price: 10),
        AddOn(name: "Lemon Slice", price: 20),
      ],
    ),
  ];

  //delivery address
  String? _deliveryAddress = "Gatthaghar, Bhaktapur";

  //G E T  T E R S
  // Getter for the menu
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String? get deliveryAddress => _deliveryAddress;

// O P E R A T I O N S
//user cart
  final List<CartItem> _cart = [];

//ADD TO CART
  void addToCart(Food food, List<AddOn> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if selected list of addons and foos are same
      bool isSameFood = item.food == food;
      bool isSameAddons = item.selectedAddons == selectedAddons;
      return isSameAddons && isSameFood;
    });
    //if items already exist, increase it's quanitity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    //otheriwse add a new item to the cart
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //total price of items in cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (AddOn addOn in cartItem.selectedAddons) {
        total += addOn.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //get total number of items in cart
  int totalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

// update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

//H E L P E R

//generate a receipt

  String generateReceipt() {
    double total = 0.0;
    int itemCount = 0;
    StringBuffer receipt = StringBuffer();
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln("Here's your receipt: ");
    receipt.writeln('----------------------------');

    receipt.writeln("${deliveryAddress}");
    receipt.writeln('----------------------------');

    receipt.writeln(formattedDate);

    receipt.writeln('----------------------------');

    for (CartItem item in _cart) {
      double itemTotal = item.food.price * item.quantity;
      receipt.writeln(
          '${item.food.name} x${item.quantity}: \Rs.${item.food.price.toStringAsFixed(2)} each');

      for (AddOn addOn in item.selectedAddons) {
        itemTotal += addOn.price * item.quantity;
        receipt.writeln(
            '  - ${addOn.name}: \Rs.${addOn.price.toStringAsFixed(2)}');
      }

      total += itemTotal;
      itemCount += item.quantity;
      receipt.writeln('Item Total: \Rs.${itemTotal.toStringAsFixed(2)}');
      receipt.writeln('----------------------------');
    }

    receipt.writeln('Total Items: $itemCount');
    receipt.writeln('Total: \Rs.${total.toStringAsFixed(2)}');
    return receipt.toString();
  }

//format double value into money
  String _formatPrice(double price) {
    return "${price.toStringAsFixed(2)}";
  }

// format list of addoNS into string summary
  String _formatAddOns(List<AddOn> addons) {
    return addons.map((addon) => "${addon.name} ${addon.price}").join(", ");
  }
}
