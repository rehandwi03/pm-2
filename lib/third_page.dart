import 'package:flutter/material.dart';

class ThirPage extends StatelessWidget {
  const ThirPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Page"),
      ),
      body: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back to Webview")),
            ElevatedButton(onPressed: () {}, child: Text("Close"))
          ],
        )),
      ),
    );
  }
}
