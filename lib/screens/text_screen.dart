import 'package:flutter/material.dart';
import 'package:textify/utils/colors.dart';
import 'package:textify/utils/util.dart';
import 'package:flutter/services.dart';

class TextScreen extends StatelessWidget {
  final String textSubtitle;
  final String textTitle;
  final String timeStamp;

  const TextScreen(
      {Key? key,
      required this.textSubtitle,
      required this.textTitle,
      required this.timeStamp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: Icon(Icons.copy),
            onPressed: () async {
              showSnackbar(context, "Copied to clipboard");
              await Clipboard.setData(ClipboardData(text: textTitle));
            },
          ),
        )
      ], backgroundColor: mobileBackground, title: Text("Textify")),
      body: Container(
        color: mobileBackground,
        child: Column(
          children: [
            Card(
              color: mobileBackground,
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.white30,
                ),
              ),
              child: ListTile(
                title: Text(
                  textTitle,
                  style: const TextStyle(
                    fontFamily: 'JetBrains Mono'
                  ),
                ),
              ),
            ),
            Card(
              color: mobileBackground,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: getMapping(textSubtitle),
                ),
              ),
              child: ListTile(
                title: Text(
                  textSubtitle,
                  style: const TextStyle(
                    fontFamily: 'JetBrains Mono'
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
