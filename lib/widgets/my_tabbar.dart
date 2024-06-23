import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_model.dart';

class MyTabbar extends StatelessWidget {
  final TabController tabController;

  const MyTabbar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabbar() {
    return FoodCategory.values.map((category) {
      String categoryName = category.toString().split('.').last;
      String capitalizedCategoryName = categoryName[0].toUpperCase() +
          categoryName.substring(1).toLowerCase();
      return Tab(text: capitalizedCategoryName);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return TabBar(
      controller: tabController,
      tabs: _buildCategoryTabbar(),
      indicatorColor: colorScheme.primary,
      indicatorWeight: 3.0,
      labelColor: colorScheme.inversePrimary,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      ),
      unselectedLabelColor: colorScheme.primary,
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      ),
      dividerColor: colorScheme.primary,

      // isScrollable: true,
    );
  }
}
