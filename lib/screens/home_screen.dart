import 'package:flutter/material.dart';
import 'package:textify/screens/add_text_screen.dart';
import 'package:textify/screens/settings_screen.dart';
import 'package:textify/utils/colors.dart';
import 'package:textify/screens/text_screen.dart';
import 'package:textify/controller/text_controller.dart';
import 'package:textify/utils/util.dart';

import 'package:textify/models/text_model.dart' as textModel;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<textModel.Text>> texts = TextController.getTexts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddTextScreen()));
          },
          child: Icon(Icons.add)),
      appBar: AppBar(
        backgroundColor: mobileBackground,
        title: const Text("Textify"),
        leading: Container(),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                texts = TextController.getTexts();
              });
            },
          ),
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
      body: FutureBuilder(
        future: texts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // print(snapshot.data);
            if (snapshot.hasData == false) {
              // showSnackbar(context, "Error retrieving texts");
              debugPrint(snapshot.error.toString());
              return Container(
                  decoration: const BoxDecoration(
                    color: mobileBackground,
                  ),
                  child: const Center(child: Text("Error!")));
            } else {
              return ContentWidget(
                  texts: snapshot.data as List<textModel.Text>);
            }
          } else {
            return Container(
                decoration: const BoxDecoration(
                  color: mobileBackground,
                ),
                child: const Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  final List<textModel.Text> texts;

  const ContentWidget({
    Key? key,
    required List<textModel.Text> this.texts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackground,
      child: ListView.builder(
        itemCount: texts.length,
        itemBuilder: (context, index) {
          return TextWidget(
            textSubtitle: texts[index].type,
            textTitle: texts[index].content,
            textIcon: getIcon(texts[index].type),
            borderColor: getMapping(texts[index].type),
          );
        },
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
