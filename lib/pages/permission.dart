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
  String _selectedPermissionType = 'Pilih Jenis Izin';
  final List<String> _permissionTypes = ['Pilih Jenis Izin', 'Sakit', 'Kepentingan Pribadi', 'Cuti', 'Lainnya'];
  final TextEditingController _descriptionController = TextEditingController();

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
    String formattedDate = DateFormat('dd MMMM yyyy').format(_selectedDate);

    return Scaffold(
      body: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildDateSelector(formattedDate),
                  _buildPermissionForm(),
                ],
              ),
            ),
          ),
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
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, bottom: 5),
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
        ],
      ),
    );
  }

  Widget _buildDateSelector(String formattedDate) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
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
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.calendar_month_outlined),
                    onPressed: () => _selectDate(context),
                    color: Colors.blue.shade900,
                  ),
                  Text(
                    formattedDate,
                    style: GoogleFonts.poppins(fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPermissionForm() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Jenis Izin",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: _selectedPermissionType,
            onChanged: (String? newValue) {
              setState(() {
                _selectedPermissionType = newValue!;
              });
            },
            items: _permissionTypes.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: GoogleFonts.poppins(fontSize: 12)),
              );
            }).toList(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Deskripsi",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: ElevatedButton(
              onPressed: () {
                // Handle form submission
                Get.toNamed('/menu-nav');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF305E8B),
                minimumSize: Size(double.infinity, 50),
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Kirim",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
