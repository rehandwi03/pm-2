import 'package:flutter/material.dart';
import 'package:pm_2/tab_page/page_four.dart';
import 'package:pm_2/tab_page/page_one.dart';
import 'package:pm_2/tab_page/page_three.dart';
import 'package:pm_2/tab_page/page_two.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Bar',
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Formatif"),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("Tab 1"),
              ),
              Tab(
                child: Text("Tab 2"),
              ),
              Tab(
                child: Text("Tab 3"),
              ),
              Tab(
                child: Text("Tab 4"),
              )
            ],
          ),
        ),
        body: TabBarView(
            children: [PageOne(), PageTwo(), PageThree(), PageFour()]),
      ),
    );
  }
}
