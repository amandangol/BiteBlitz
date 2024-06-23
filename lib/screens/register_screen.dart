import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/home_screen.dart';
import 'package:food_delivery_app/screens/login_screen.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';
import 'package:food_delivery_app/utils/error_messages.dart';
import 'package:food_delivery_app/widgets/my_button.dart';
import 'package:food_delivery_app/widgets/my_textfield.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback? onTap;

  RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void register() async {
    final authService = AuthService();

    try {
      await authService.signUpwithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } catch (e) {
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            // Add SingleChildScrollView to prevent overflow issues
            padding:
                const EdgeInsets.all(16.0), // Add padding for better spacing
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Image.asset(
                  'assets/images/logo_nobg.png',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(height: 25),

                // slogan
                Text(
                  "Let's create an account for you",
                  style: TextStyle(
                    letterSpacing: 0.5,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 25),

                // email
                MyTextfield(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                // password
                MyTextfield(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter the password";
                    }
                    return null;
                  },
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 10),

                // confirm password
                MyTextfield(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm the password";
                    }
                    if (value != passwordController.text) {
                      return "Confirm password doesn't match the password";
                    }
                    return null;
                  },
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
                const SizedBox(height: 25),

                // register button
                CustomButton(
                  text: "Register",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      return register();
                    }
                    ;
                  },
                ),
                const SizedBox(height: 25),

                // already have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                LoginScreen(onTap: widget.onTap),
                          ),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
