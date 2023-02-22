// Tugas Barcode

import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

void main() {
  runApp(const BarcodeApp());
}

class BarcodeApp extends StatelessWidget {
  const BarcodeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode ',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Barcode'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BarcodeWidget(
                    barcode: Barcode.code128(
                      useCode128A: false,
                      useCode128B: true,
                      useCode128C: false,
                    ),
                    data: 'Alterra Academy',
                    height: 80,
                    width: 200,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BarcodeWidget(
                    barcode: Barcode.code128(),
                    data: 'Flutter Asik',
                    height: 200,
                    width: 200,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BarcodeWidget(
                    barcode: Barcode.code128(
                    ),
                    data: 'MuhammadNoorArifin',
                    height: 80,
                    width: 200,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BarcodeWidget(
                    barcode: Barcode.codabar(),
                    data: '1234-56784',
                    height: 80,
                    width: 200,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BarcodeWidget(
                    barcode: Barcode.qrCode(),
                    data: 'QR Code',
                    height: 200,
                    width: 200,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}