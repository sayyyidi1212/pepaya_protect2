import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class Permission extends StatefulWidget {
  @override
  _PermissionState createState() => _PermissionState();
}

class _PermissionState extends State<Permission> {
  late DateTime _selectedDate;
  // String _selectedItem = 'Pilih Izin';
  // List<String> _dropdownItems = ['Sakit', 'Acara Keluarga', 'Tukar Shift', 'Lainnya'];

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd-MMMM-yyyy').format(_selectedDate);

    return Scaffold(
      body: Column(
        children: [
          _buildAppBar(),
          _buildDateSelector(formattedDate),
          _buildPermissionType(),
          // Tambahkan widget-form Anda di sini
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.only(
        top: 40,
        left: 15,
        right: 15,
        bottom: 10,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF356899),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, bottom: 5),
            child: Text(
              "Form Izin",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                wordSpacing: 2,
                color: Colors.white,
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildDateSelector(String formattedDate) {
    return Container(
      padding: const EdgeInsets.fromLTRB(190.0, 40.0, 0.0, 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 185,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            padding: const EdgeInsets.all(0.5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.calendar_month_outlined),
                  onPressed: () => _selectDate(context),
                  color: Colors.blue.shade900,
                ),
                SizedBox(width: 2),
                Text(
                  formattedDate,
                  style: GoogleFonts.poppins(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildPermissionType() {
  List<String> permissionTypes = ['Pilih Jenis Izin', 'Sakit', 'Kepentingan Pribadi', 'Cuti', 'Lainnya']; 
  String selectedPermissionType = permissionTypes[0]; 

  return SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Jenis Izin",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10), 
          DropdownButtonFormField<String>(
            value: selectedPermissionType,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  selectedPermissionType = newValue;
                });
              }
            },
            items: permissionTypes.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: InputDecoration(
              border: OutlineInputBorder(), 
            ),
          ),
          SizedBox(height: 20), 
          Text(
            "Deskripsi",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10), 
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            maxLines: 3, 
          ),
          SizedBox(height: 20), 
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: ElevatedButton(
              onPressed: () => Get.toNamed('/menu-nav'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF305E8B),
                minimumSize: Size(double.infinity, 50),
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("Kirim",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    ),
  );
}
}