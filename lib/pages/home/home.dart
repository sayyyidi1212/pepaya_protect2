import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _headerHome(),
          const SizedBox(height: 20), // Menambahkan jarak di antara header dan section deteksi penyakit
          _diseaseDetectionSection(),
          const SizedBox(height: 20), // Menambahkan jarak di bawah section deteksi penyakit
          _temperatureHumidityIndicator(), // Menambahkan indikator suhu dan kelembapan
        ],
      ),
    );
  }

  Widget _headerHome() {
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 5),
      decoration: const BoxDecoration(
       color: Color.fromARGB(255, 155, 241, 174),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 3, bottom: 3),
                  child: Text(
                    "Welcome Back!",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3, bottom: 25),
                  child: Text('User Name',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/user_profile.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _diseaseDetectionSection() {
  return Container(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Deteksi Penyakit Buah Pepaya',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w700, // Menggunakan berat huruf yang lebih tebal
            color: Colors.green.shade800, // Mengubah warna teks
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Ikuti langkah-langkah berikut untuk mendeteksi penyakit:',
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54), // Mengubah warna teks
        ),
        const SizedBox(height: 10),
        _stepsSection(),
        const SizedBox(height: 20), // Menambahkan jarak lebih untuk tombol
        Center( // Menambahkan Center di sini
          child: ElevatedButton.icon(
            onPressed: () {
              // Tambahkan fungsi untuk mengunggah gambar dan memulai deteksi penyakit
            },
            icon: const Icon(Icons.upload_file), // Menambahkan ikon ke tombol
            label: const Text('Unggah Gambar'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[700], // Mengubah warna tombol
              foregroundColor: Colors.white, // Mengubah warna teks tombol
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Mengubah padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60), // Membuat tombol lebih melengkung
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


  Widget _stepsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _stepImage('assets/images/profile.jpeg', 'Ambil Gambar'), // Ganti dengan path gambar Anda
        _arrowIcon(),
        _stepImage('assets/images/profile.jpeg', 'Unggah Gambar'), // Ganti dengan path gambar Anda
        _arrowIcon(),
        _stepImage('assets/images/profile.jpeg', 'Lihat Hasil'), // Ganti dengan path gambar Anda
      ],
    );
  }

  Widget _stepImage(String imagePath, String label) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 60, // Sesuaikan ukuran gambar
          height: 60,
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _arrowIcon() {
    return Icon(
      FontAwesomeIcons.arrowRight,
      size: 30,
      color: Colors.grey,
    );
  }

  Widget _temperatureHumidityIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _indicatorCard('Suhu', '30°C', Colors.orange), // Ganti dengan nilai aktual
        _indicatorCard('Kelembapan', '75%', Colors.blue), // Ganti dengan nilai aktual
      ],
    );
  }

  Widget _indicatorCard(String title, String value, Color color) {
  IconData? weatherIcon; // Variabel untuk menyimpan ikon cuaca

  // Menentukan ikon berdasarkan judul
  if (title == 'Cuaca') {
    weatherIcon = FontAwesomeIcons.sun; // Ikon untuk cuaca cerah
  } else if (title == 'Suhu') {
    weatherIcon = FontAwesomeIcons.thermometerHalf; // Ikon untuk suhu
  } else if (title == 'Kelembapan') {
    weatherIcon = FontAwesomeIcons.cloudRain; // Ikon untuk kelembapan
  }

  return Card(
    elevation: 3,
    child: Container(
      padding: const EdgeInsets.all(15),
      width: 120, // Sesuaikan lebar kartu
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          // Menambahkan ikon cuaca
          if (weatherIcon != null)
            Icon(
              weatherIcon,
              size: 30,
              color: color,
            ),
        ],
      ),
    ),
  );
}

}
