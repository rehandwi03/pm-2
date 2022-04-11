import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pm_2/third_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page")),
      body: Container(
          child: Stack(
        children: [
          WebView(
            initialUrl: "https://rehandwi03.github.io",
          ),
          Positioned(
              bottom: 50,
              left: 150,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ThirPage()));
                  },
                  child: Text("Go to Last Page")))
        ],
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
}
