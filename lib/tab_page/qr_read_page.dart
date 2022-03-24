import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrReadPage extends StatelessWidget {
  const QrReadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: QrImage(
            data: "ecampus.binainsani.ac.id",
            version: 6,
            errorCorrectionLevel: QrErrorCorrectLevel.M,
            padding: EdgeInsets.all(6),
            size: 300,
          ),
        ),
      ),
    );
  }
}
