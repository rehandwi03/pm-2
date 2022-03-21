import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Task 3"),
          ),
          body: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.all(20),
            child: WebView(
              initialUrl: "https://rehandwi03.github.io",
              javascriptMode: JavascriptMode.unrestricted,
            ),
          )),
    );
  }

  Future<bool> showExitPopup(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Do you want to exit?"),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Yes"),
                      )),
                      SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {},
                        child: Text("No"),
                      ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
