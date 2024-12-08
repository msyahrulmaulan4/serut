import 'package:flutter/material.dart';
import 'package:serut/features/home/bantuan.dart';
import 'package:serut/features/home/cekstatus.dart';
import 'package:serut/features/home/profile.dart';
import 'package:serut/features/home/submissionform.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome text
            const Text(
              "Selamat Datang,",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            const Text(
              "Muhammad Syahrul Maulana",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30), // Space between text and grid

            // Grid layout for icons
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                children: [
                  // Pengajuan
                  buildGridItem(
                    image: 'assets/pengajuan.png',
                    title: 'Pengajuan',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SubmissionForm()),
                    ),
                  ),
                  // Cek Status
                  buildGridItem(
                    image: 'assets/cek_status.png',
                    title: 'Cek Status',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CekStatusScreen()),
                    ),
                  ),
                  // Akun
                  buildGridItem(
                    image: 'assets/akun.png',
                    title: 'Akun',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()),
                    ),
                  ),
                  // Bantuan
                  buildGridItem(
                    image: 'assets/bantuan.png',
                    title: 'Bantuan',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BantuanScreen()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build each grid item (Pengajuan, Cek Status, etc.)
  Widget buildGridItem({
    required String image,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 50,
              color: const Color(0xFF4FC8ED), // Color 4FC8ED for icons
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
