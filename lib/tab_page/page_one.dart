import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(30),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.green,
        child: Center(
            child: Text(
          "Text",
          style: TextStyle(color: Colors.white, fontSize: 30),
        )),
      ),
    );
  }
}
