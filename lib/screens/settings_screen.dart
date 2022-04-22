import 'package:flutter/material.dart';
import 'package:textify/utils/colors.dart';
import 'package:textify/screens/login_screen.dart';

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
            QRCodeWidget(),
            ShowIDWidget(),
            Card(
                shape: const RoundedRectangleBorder(
                    side: BorderSide(
                  color: Colors.redAccent,
                )),
                color: mobileBackground,
                child: ListTile(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LogInScreen();
                          },
                        ),
                      );
                    },
                    title: Center(child: Text("Log Out")),
                    trailing: Icon(Icons.logout)))
          ],
        ),
      ),
    );
  }
}

class ShowIDWidget extends StatelessWidget {
  const ShowIDWidget({
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
        child: const ListTile(
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
