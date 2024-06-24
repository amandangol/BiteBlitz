import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/provider/auth_provider.dart';
import 'package:food_delivery_app/screens/home_screen.dart';
import 'package:food_delivery_app/screens/register_screen.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';
import 'package:food_delivery_app/utils/error_messages.dart';
import 'package:food_delivery_app/utils/loading_dialog.dart';
import 'package:food_delivery_app/widgets/my_button.dart';
import 'package:food_delivery_app/widgets/my_textfield.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback? onTap;

  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

//login method
  void login() async {
    final authService = AuthService();
    try {
      showLoadingDialog(context);
      await authService.signInwithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
      hideLoadingDialog(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text("Logged in succesfully"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(10),
        ),
      );
    } catch (e) {
      hideLoadingDialog(context);
      // Log the error and its type
      print("Error: $e");
      print("Error Type: ${e.runtimeType}");

      String errorMessage = getErrorMessage(e as Exception);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(errorMessage),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ObscureProvider>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo_nobg.png',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Food Delivery App",
                  style: TextStyle(
                      letterSpacing: 2,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 25,
                ),
                MyTextfield(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      return null;
                    },
                    controller: emailController,
                    hintText: "Email",
                    obscureText: false),
                const SizedBox(
                  height: 10,
                ),
                MyTextfield(
                    suffixIcon: value.isObscure
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onTap: value.toggleObscure,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: value.isObscure),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                  text: "Login",
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      return login();
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen(
                                      onTap: widget.onTap,
                                    )));
                      },
                      child: Text(
                        "Register Now",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
