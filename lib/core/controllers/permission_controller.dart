import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patrol_track_mobile/core/models/permission.dart';
import 'package:patrol_track_mobile/core/services/permission_service.dart';
import 'package:patrol_track_mobile/core/utils/constant.dart';
import 'package:quickalert/quickalert.dart';

class PermissionController {

  static Future<void> createPermission(BuildContext context, Permission permission) async {
    try {
      String? token = await Constant.getToken();

      if (token != null) {
        bool success = await PermissionService.postPermission(token, permission);
        if (success) {
          QuickAlert.show(
            context: context, 
            type: QuickAlertType.success,
            title: 'Success!',
            text: 'Permission created successfully',
            onConfirmBtnTap: () {
              Navigator.of(context).pop();
              Get.toNamed('/menu-nav');
            },
          );
          return;
        }
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$error'),
          backgroundColor: Colors.red,
        ),
      );
      print('Error: $error');
    }
  }
}
