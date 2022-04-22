import 'package:flutter/material.dart';
import 'package:textify/utils/colors.dart';
import 'package:textify/screens/home_screen.dart';

class IdInputScreen extends StatelessWidget {
  IdInputScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: mobileBackground,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Enter your ID"),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 300,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: "12 letter ID",
                  border: OutlineInputBorder(),
                  focusColor: successButton,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.only(
                right: 50,
                left: 50,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: successButton,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.done)),
            )
          ],
        ),
      ),
    );
  }
}
