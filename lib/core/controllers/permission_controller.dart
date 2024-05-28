import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patrol_track_mobile/core/services/permission_service.dart';
import 'package:image_picker/image_picker.dart'; // Import ImagePicker

class PermissionController {

  static Future<void> postPermission(BuildContext context, String token, TextEditingController date, TextEditingController reason) async {
    final picker = ImagePicker(); // Buat instance ImagePicker

    List<String> imagePaths = []; // Buat list untuk menyimpan path file gambar yang akan diunggah

    try {
      // Ambil gambar dari galeri
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imagePaths.add(pickedFile.path); // Tambahkan path file gambar ke dalam list
      }

      bool success = await PermissionService.postPermission(token, date.text, reason.text, imagePaths);
      if (success) {
        print('Permission created successfully');
        Get.toNamed('/menu-nav');
      } else {
        print('Failed to create permission');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
