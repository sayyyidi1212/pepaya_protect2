import 'package:flutter/material.dart';
import 'package:patrol_track_mobile/components/header.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  List<NotificationItem> notifications = [
    NotificationItem(
      message: 'Tanaman membutuhkan air.',
      solution: 'Segera siram tanaman.',
      icon: Icons.water_drop,
      color: Colors.blue,
      time: DateTime.now().subtract(Duration(minutes: 2)), // Waktu sekarang dikurangi 2 menit
    ),
    NotificationItem(
      message: 'Suhu tanah terlalu tinggi.',
      solution: 'Tutup tanaman dengan naungan atau siram dengan air.',
      icon: Icons.thermostat,
      color: Colors.red,
      time: DateTime.now().subtract(Duration(minutes: 5)), // Waktu sekarang dikurangi 5 menit
    ),
    NotificationItem(
      message: 'Suhu tanah terlalu tinggi.',
      solution: 'Tutup tanaman dengan naungan atau siram dengan air.',
      icon: Icons.thermostat,
      color: Colors.red,
      time: DateTime.now().subtract(Duration(minutes: 10)), // Waktu sekarang dikurangi 10 menit
    ),
    NotificationItem(
      message: 'Tanaman membutuhkan air.',
      solution: 'Segera siram tanaman.',
      icon: Icons.water_drop,
      color: Colors.blue,
      time: DateTime.now().subtract(Duration(minutes: 15)), // Waktu sekarang dikurangi 15 menit
    ),
    NotificationItem(
      message: 'Suhu tanah terlalu tinggi.',
      solution: 'Tutup tanaman dengan naungan atau siram dengan air.',
      icon: Icons.thermostat,
      color: Colors.red,
      time: DateTime.now().subtract(Duration(minutes: 30)), // Waktu sekarang dikurangi 30 menit
    ),
  ];

  void _removeNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  String _timeAgo(DateTime time) {
    final difference = DateTime.now().difference(time);
    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} detik yang lalu';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} menit yang lalu';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} jam yang lalu';
    } else {
      return '${difference.inDays} hari yang lalu';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(title: "Notifikasi"),
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: notifications[index].color.withOpacity(0.2),
                      child: Icon(
                        notifications[index].icon,
                        color: notifications[index].color,
                      ),
                    ),
                    title: Text(
                      notifications[index].message,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notifications[index].solution,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _timeAgo(notifications[index].time), // Menampilkan waktu yang telah berlalu
                          style: const TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeNotification(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationItem {
  final String message;
  final String solution;
  final IconData icon;
  final Color color;
  final DateTime time; // Menambahkan waktu notifikasi

  NotificationItem({
    required this.message,
    required this.solution,
    required this.icon,
    required this.color,
    required this.time, // Tambahkan parameter waktu
  });
}
