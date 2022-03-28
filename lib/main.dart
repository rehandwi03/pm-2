import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

Widget button(BuildContext context, String url, btnText, IconData icon) {
  return TextButton(
      onPressed: () async {
        if (!await launch(url)) throw 'Could not launch';
      },
      child: Container(
        child: Column(
          children: [
            Icon(
              icon,
              size: 80,
            ),
            Text(btnText)
          ],
        ),
      ));
}

class Home extends StatelessWidget {
  String googleUrl =
      'https://www.google.com/maps/dir/?api=1&destination=72.817622,19.123799';

  Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pertemuan 5"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(context, "https://flutter.dev", "Website",
                    Icons.open_in_browser),
                button(
                    context,
                    'mailto:rehandwi2910@gmail.com?subject=This is Subject Title&body=This is Body of Email',
                    "Email",
                    Icons.email)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(context, "tel:+6281317588508", "Phone", Icons.phone),
                button(
                    context, 'sms:+6281317588508?body=Halo', "SMS", Icons.sms)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(context, googleUrl, "Location", Icons.location_on),
                TextButton(onPressed: () {}, child: Text("Scan"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
