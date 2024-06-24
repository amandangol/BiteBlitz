import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery_app/screens/delivery_progress_screen.dart';
import 'package:food_delivery_app/utils/loading_dialog.dart';
import 'package:food_delivery_app/widgets/my_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = true;
  bool showBackView = false;

  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "Confirm Payment",
            textAlign: TextAlign.left,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  "Card Holder Name: $cardHolderName",
                ),
                const SizedBox(
                  height: 5,
                ),
                Text("Card Number: $cardNumber"),
                const SizedBox(
                  height: 5,
                ),
                Text("Expiry Date: $expiryDate"),
                const SizedBox(
                  height: 5,
                ),
                Text("CVV: $cvvCode"),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                // style:
                //     TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DeliveryProgressScreen()));
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 0, 59, 104)),
                child: const Text(
                  "Pay Now",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text("Payment"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: showBackView,
            onCreditCardWidgetChange: (p0) {},
          ),
          CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (data) {
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
              });
            },
            formKey: formKey,
          ),
          const Spacer(),
          CustomButton(
            text: "Pay Now",
            onTap: () {
              userTappedPay();
            },
          ),
          // const SizedBox(
          //   height: 10,
          // ),
        ],
      ),
    );
  }
}
