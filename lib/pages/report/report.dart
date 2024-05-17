import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  final String scanData;

  Report({required this.scanData});

  @override
  Widget build(BuildContext context) {
    TextEditingController result = TextEditingController();
    result.text = scanData;

    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: result,
              decoration: InputDecoration(
                labelText: 'Scan Data',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
