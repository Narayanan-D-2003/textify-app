import 'package:flutter/material.dart';

const mobileBackground = Color.fromRGBO(0, 0, 0, 1);
const successButton = Color.fromRGBO(0, 149, 246, 1);

Color getMapping(String type) {
  if (type == "code") {
    return Colors.blue;
  } else if (type == "clipboard") {
    return Colors.red;
  } else if (type == "command") {
    return Colors.green;
  } else {
    return Colors.white;
  }
}

Icon getIcon(String type) {
  if (type == "code") {
    return Icon(Icons.code);
  } else if (type == "clipboard") {
    return Icon(Icons.copy);
  } else if (type == "command") {
    return Icon(Icons.terminal);
  } else {
    return Icon(Icons.abc);
  }
}
