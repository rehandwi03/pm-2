import 'package:flutter/material.dart';

Widget buildText(String text) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    child: Text(
      text,
      style: TextStyle(fontSize: 20),
    ),
  );
}

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildText("Ini Text 1"),
          buildText(
            "Ini Text 2",
          ),
          buildText("Ini Text 3"),
          buildText("Ini Text 4")
        ],
      ),
    );
  }
}
