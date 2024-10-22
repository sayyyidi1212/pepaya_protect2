import 'package:flutter/material.dart';
import 'dart:io'; // Import File class

class ReportPage extends StatelessWidget {
  final String scanData;
  final File? imageFile; // Tambahkan parameter imageFile

  ReportPage({required this.scanData, this.imageFile}); // Update konstruktor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report Page"),
      ),
      body: Column(
        children: <Widget>[
          Text('Scan Data: $scanData'),
          if (imageFile != null)
            Image.file(imageFile!), // Tampilkan gambar jika ada
          if (imageFile == null)
            Text('No image captured'), // Pesan jika gambar tidak ada
        ],
      ),
    );
  }
}
