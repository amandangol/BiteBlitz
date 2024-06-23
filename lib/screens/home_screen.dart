import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'package:food_delivery_app/models/restaurant_model.dart';
import 'package:food_delivery_app/screens/food_screen.dart';
import 'package:food_delivery_app/widgets/my_current_location.dart';
import 'package:food_delivery_app/widgets/my_description_box.dart';
import 'package:food_delivery_app/widgets/my_drawer.dart';
import 'package:food_delivery_app/widgets/my_foodtile.dart';
import 'package:food_delivery_app/widgets/my_sliver_appbar.dart';
import 'package:food_delivery_app/widgets/my_tabbar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
  //   return fullMenu.where((food) => food.category == category).toList();
  // }

  List<Food> _filterMenyByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenyByCategory(category, fullMenu);
      return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: categoryMenu.length,
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return MyFoodTile(
            food: food,
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodScreen(
                            food: food,
                          )));
            },
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        drawer: const MyDrawer(),
        body: NestedScrollView(
            // This builds the scrollable content above the body
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  MySliverAppbar(
                      title: MyTabbar(
                        tabController: _tabController,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Divider(
                            indent: 25,
                            endIndent: 25,
                            color: colorScheme.secondary,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          MyCurrentLocation(),
                          const MyDescriptionBox()
                        ],
                      ))
                ],
            // The content of the scroll view
            body: Consumer<RestaurantModel>(
              builder: (context, value, child) => TabBarView(
                controller: _tabController,
                children: getFoodInThisCategory(value.menu),
              ),
            )),
      ),
    );
  }
}
