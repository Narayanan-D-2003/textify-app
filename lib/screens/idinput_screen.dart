import 'package:flutter/material.dart';
import 'package:textify/controller/user_controller.dart';
import 'package:textify/utils/colors.dart';
import 'package:textify/screens/home_screen.dart';
import 'package:textify/utils/util.dart';

class IdInputScreen extends StatefulWidget {
  IdInputScreen({Key? key}) : super(key: key);

  @override
  State<IdInputScreen> createState() => _IdInputScreenState();
}

class _IdInputScreenState extends State<IdInputScreen> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserController dataController = UserController();
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
                controller: textController,
                decoration: const InputDecoration(
                  labelText: "Enter your UID",
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
                  onPressed: () async {
                    String text = textController.text;
                    bool response = await UserController.storeID(text);
                    if (response) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomeScreen();
                          },
                        ),
                      );
                    } else {
                      showSnackbar(context, "Something went wrong");
                    }
                  },
                  icon: const Icon(Icons.done)),
            )
          ],
        ),
      ),
    );
  }
}
