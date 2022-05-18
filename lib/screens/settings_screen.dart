import 'package:flutter/material.dart';
import 'package:textify/utils/colors.dart';
import 'package:textify/screens/login_screen.dart';
import 'package:textify/controller/user_controller.dart';
import 'package:flutter/services.dart';
import 'package:textify/utils/util.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackground,
        title: const Center(child: Text("Textify")),
      ),
      body: Container(
        width: double.infinity,
        color: mobileBackground,
        child: Column(
          children: [
            // QRCodeWidget(),
            ShowIDWidget(),
            LogOutWidget()
          ],
        ),
      ),
    );
  }
}

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: const RoundedRectangleBorder(
            side: BorderSide(
          color: Colors.redAccent,
        )),
        color: mobileBackground,
        child: ListTile(
            onTap: () async {
              bool status = await UserController.deleteID();
              if (status = true) {
                debugPrint("Deleting UID was success");
                showSnackbar(context, "Logged out successfully");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LogInScreen();
                    },
                  ),
                );
              } else {
                showSnackbar(context, "There was some error while logging out");
              }
            },
            title: Center(child: Text("Log Out")),
            trailing: Icon(Icons.logout)));
  }
}

class ShowIDWidget extends StatelessWidget {
  ShowIDWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.white30,
          ),
        ),
        color: mobileBackground,
        child: ListTile(
            onTap: () {
              UserController.getID().then(
                (String id) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          // backgroundColor: mobileBackground,
                          title: const Text("Your UUID"),
                          content: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.copy),
                                onPressed: () async {
                                  showSnackbar(context , "Copied to clipboard");
                                  await Clipboard.setData(
                                      ClipboardData(text: id));
                                },
                              ),
                              Text(id,
                                  style: const TextStyle(
                                    fontSize: 10,
                                  )),
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ]);
                    },
                  );
                },
              );
            },
            title: Text("Show ID"),
            subtitle: Text("Used to share ID's"),
            trailing: Icon(Icons.fingerprint)));
  }
}

class QRCodeWidget extends StatelessWidget {
  const QRCodeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.white30),
      ),
      color: mobileBackground,
      child: const ListTile(
          title: Text("Show QR Code"),
          subtitle: Text("Used to share ID's"),
          trailing: Icon(Icons.qr_code, color: Colors.white)),
    );
  }
}
