import 'package:flutter/material.dart';
import 'package:textify/utils/colors.dart';
import 'package:textify/controller/text_controller.dart';
import 'package:textify/utils/util.dart';

class AddTextScreen extends StatefulWidget {
  @override
  State<AddTextScreen> createState() => _AddTextScreenState();
}

class _AddTextScreenState extends State<AddTextScreen> {
  final _typeController = TextEditingController();

  final _contentController = TextEditingController();

  var keepLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: mobileBackground,
            title: Text("Textify")),
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            color: mobileBackground,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _typeController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.white54,
                    ),
                    hintText: 'Type',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusColor: successButton,
                    hoverColor: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  controller: _contentController,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.white54,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Content',
                    // focusColor: successButton,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                child: ElevatedButton(
                  child: keepLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Push"),
                  onPressed: () async {
                    setState(() {
                      keepLoading = true;
                    });
                    bool result = await TextController.postText(
                        _typeController.text, _contentController.text);
                    if (result == true) {
                      showSnackbar(context, "Text Pushed");
                      Navigator.pop(context);
                    } else {
                      showSnackbar(context, "Error while pushing text");
                      Navigator.pop(context);
                    }
                    setState(() {
                      keepLoading = false;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
