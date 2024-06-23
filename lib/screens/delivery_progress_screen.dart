import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryProgressScreen extends StatelessWidget {
  const DeliveryProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          // title: const Text("Delivery in progress..."),
          centerTitle: true,
        ),
        bottomNavigationBar: _buildBottomNavBar(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "assets/images/delivery.gif",
                  height: 150,
                  width: 150,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Thank you for your order!",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: colorScheme.secondary,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: colorScheme.secondary),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Consumer<RestaurantModel>(
                  builder: (context, value, child) => Text(
                    value.generateReceipt(),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(48),
          topRight: Radius.circular(48),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Aman Dangol",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "Rider",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () async {
                final sms = Uri.parse('sms:5550101234');
                if (await canLaunchUrl(sms)) {
                  launchUrl(sms);
                } else {
                  throw 'Could not launch $sms';
                }
              },
              icon: Icon(
                Icons.message,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () async {
                final call = Uri.parse('tel:+966 987654321');
                if (await canLaunchUrl(call)) {
                  launchUrl(call);
                } else {
                  throw 'Could not launch $call';
                }
              },
              icon: const Icon(
                Icons.call,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
