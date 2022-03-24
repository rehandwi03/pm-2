import 'package:flutter/material.dart';
import 'package:pm_2/tab_page/qr_read_page.dart';
import 'package:pm_2/tab_page/qr_scan_page.dart';
import 'package:pm_2/tab_page/second_page.dart';
import 'package:pm_2/tab_page/webview_page.dart';
import 'package:pm_2/widget/show_dialog.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: MaterialApp(
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Tab Bar"),
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
            body: const TabBarView(children: [
              QRScan(),
              QrReadPage(),
              WebviewPage(),
              SecondTabPage()
            ]),
          ),
        ),
      ),
    );
  }
}
