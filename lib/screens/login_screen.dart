import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textify/controller/user_controller.dart';
import 'package:textify/utils/colors.dart';
import 'package:textify/screens/home_screen.dart';
import 'package:textify/screens/idinput_screen.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({
    Key? key,
  }) : super(key: key);

  void navigateToHomeScreen() {}

  @override
  Widget build(BuildContext context) {
    UserController controller = UserController();

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: mobileBackground,
        ),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icon.jpeg",
                width: 400,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return IdInputScreen();
                          },
                        ),
                      );
                    },
                    child: const Text("Log In")),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      final String response = await controller.signUp();
                      if (response == "success") {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ),
                        );
                      }
                    },
                    child: const Text("Sign Up")),
              ),
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     child: const Text("Forgot ID")
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
