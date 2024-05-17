import 'package:flutter/material.dart';

class Presence extends StatelessWidget {
  final String scanData;

  Presence({required this.scanData});

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
