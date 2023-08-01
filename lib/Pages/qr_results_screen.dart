import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scanner/qr_scanner.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required void Function() closeScreen, required Code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0),
              letterSpacing: 1,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          QrImageView(data: '', size: 200),
          SizedBox(height: 16),
          Center(
              child: const Text("Scanned Results",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    letterSpacing: 1,
                  ))),
          SizedBox(height: 16),
          Text("RESLUT",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
                letterSpacing: 1,
              )),
          SizedBox(width: MediaQuery.of(context).size.width - 100, height: 16),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 26, 182, 26),
              ),
              onPressed: () {},
              child: Text("Copy",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    letterSpacing: 1,
                  )))
        ]),
      ),
    );
  }
}
