import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tugas Pertama"),
        ),
        body: Container(
          color: Colors.cyan,
          child: Center(
            child: Container(
              height: 180,
              width: 310,
              color: Colors.yellow[100],
              child: Column(
                children: <Widget>[
                  Text(
                    "Heading",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text.rich(
                    TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: "Lorem ipsum",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      TextSpan(
                        text:
                            " dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
                      ),
                      TextSpan(
                          text: " tempor incididunt",
                          style:
                              TextStyle(decoration: TextDecoration.underline)),
                      TextSpan(
                        text: " ut labore et dolore magna aliqua",
                      ),
                    ]),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
