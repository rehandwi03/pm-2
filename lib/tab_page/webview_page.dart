import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatelessWidget {
  const WebviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.all(20),
        child: WebView(
          initialUrl: "https://rehandwi03.github.io",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
