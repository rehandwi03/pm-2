import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

class MyNumber {
  int number;

  MyNumber({required this.number});

  int multiplyByTwo() => number * 2;
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  MyNumber mynumber = MyNumber(number: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter = Safety Null"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      hintText: 'Insert a number', label: Text("number")),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("Calculate"),
                    onPressed: () {
                      setState(() {
                        mynumber.number = int.tryParse(controller.text) ?? 0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        onPrimary: Colors.yellow,
                        onSurface: Colors.red,
                        shadowColor: Colors.green,
                        minimumSize: Size(200, 40),
                        animationDuration: Duration(milliseconds: 200),
                        elevation: 2,
                        shape: StadiumBorder(),
                        side: BorderSide(color: Colors.red.shade900, width: 2)),
                  ),
                ),
                Text('Results: ${mynumber.multiplyByTwo()}'),
              ],
            ),
          )),
    );
  }
}
