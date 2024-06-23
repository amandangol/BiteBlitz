class Food {
  final String name;
  final double price;
  final String description;
  final String imagePath;
  final FoodCategory category;
  List<AddOn> availableAddons;

  Food({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
    required this.category,
    required this.availableAddons,
  });
}

enum FoodCategory {
  pizzas,
  burgers,
  salads,
  desserts,
  drinks,
}

class AddOn {
  String name;
  double price;

  AddOn({
    required this.name,
    required this.price,
  });
}
