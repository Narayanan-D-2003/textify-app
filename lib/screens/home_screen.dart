import 'package:flutter/material.dart';
import 'package:textify/screens/settings_screen.dart';
import 'package:textify/utils/colors.dart';
import 'package:textify/screens/text_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackground,
        title: const Text("Textify"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsScreen();
                  },
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.people),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        color: mobileBackground,
        child: ListView(children: [
          TextWidget(
            textSubtitle: "Password",
            textTitle: "Example text",
            textIcon: const Icon(Icons.password),
            borderColor: Colors.redAccent,
          ),
          TextWidget(
            textSubtitle: "Code",
            textTitle: "public static void main()",
            textIcon: const Icon(Icons.code),
            borderColor: Colors.purpleAccent,
          ),
          TextWidget(
            textSubtitle: "Command",
            textTitle: "Battery 0: Discharging, 47%",
            textIcon: const Icon(Icons.code_off),
            borderColor: Colors.blueAccent,
          ),
        ]),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String textSubtitle;
  final String textTitle;
  final Icon textIcon;
  final Color borderColor;

  const TextWidget({
    Key? key,
    required this.textSubtitle,
    required this.textTitle,
    required this.textIcon,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.only(
      //   bottom: 8.0,
      // ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: borderColor,
          width: 0.25,
        ),
      ),
      color: mobileBackground,
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TextScreen(
                  textSubtitle: textSubtitle,
                  textTitle: textTitle,
                  timeStamp: "51123",
                );
              },
            ),
          );
        },
        title: Text(textTitle),
        subtitle: Text(textSubtitle),
        trailing: textIcon,
      ),
    );
  }
}
