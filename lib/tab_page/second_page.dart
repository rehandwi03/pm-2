import 'package:flutter/material.dart';
import 'package:pm_2/second_page.dart';

class SecondTabPage extends StatelessWidget {
  const SecondTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: ElevatedButton(
        child: Text("Second page"),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondPage()));
        },
      )),
    );
  }
}
