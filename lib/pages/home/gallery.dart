import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  File? _selectedImage; // Variabel untuk menyimpan gambar yang dipilih
  final ImagePicker _picker = ImagePicker(); // Inisialisasi ImagePicker

  // Fungsi untuk memilih gambar dari galeri
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path); // Simpan gambar yang dipilih
      });
    } else {
      // Jika pengguna batal memilih gambar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tidak ada gambar yang dipilih')),
      );
    }
  }

  // Fungsi untuk melakukan scan gambar
  void _scanImage() {
    if (_selectedImage != null) {
      // Tambahkan logika untuk mendeteksi penyakit pada gambar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mulai proses deteksi penyakit...')),
      );
      // Di sini kamu bisa memanggil fungsi deteksi penyakit yang telah kamu buat
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Silakan pilih gambar terlebih dahulu')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              ' Deteksi Gambar',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            _selectedImage != null
                ? Image.file(
                    _selectedImage!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                : const Text(
                    'Tidak ada gambar yang dipilih',
                    style: TextStyle(fontSize: 18),
                  ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _pickImageFromGallery, // Panggil fungsi untuk memilih gambar
              icon: const Icon(Icons.photo),
              label: const Text('Pilih Gambar'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _scanImage, // Panggil fungsi untuk scan gambar
              icon: const Icon(Icons.scanner),
              label: const Text('Scan Gambar'),
            ),
          ],
        ),
      ),
    );
  }
}
