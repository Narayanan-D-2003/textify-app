import 'package:flutter/material.dart';
import 'package:textify/utils/colors.dart';

class TextScreen extends StatelessWidget {
  final String textSubtitle;
  final String textTitle;
  final String timeStamp;

  const TextScreen({
    Key? key,
    required this.textSubtitle,
    required this.textTitle,
    required this.timeStamp
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackground,
        title: Text("Textify")
      ),
      body: Container(
        color: mobileBackground,
        child: Column(
          children: [
            ListTile(
              title: Center(child: Text(textSubtitle)),
            ),
          ]
        )
      ),
    );
  }
}
