import 'package:flutter/material.dart';

class CekStatusScreen extends StatefulWidget {
  const CekStatusScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CekStatusScreenState createState() => _CekStatusScreenState();
}

class _CekStatusScreenState extends State<CekStatusScreen> {
  // Data dummy untuk status pengajuan
  final List<Map<String, dynamic>> pengajuanList = [
    {
      'tanggal': '10/05/2024',
      'status': 'Selesai',
      'canPrint': true,
    },
    {
      'tanggal': '07/05/2024',
      'status': 'Menunggu Persetujuan RT',
      'canPrint': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 80),
            // Title "CEK STATUS" centered
            const Center(
              child: Text(
                'CEK STATUS',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),

            // List of submissions
            ...pengajuanList.map((pengajuan) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pengajuan ${pengajuan['tanggal']}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Status : ${pengajuan['status']}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: pengajuan['canPrint'] ? () {} : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: pengajuan['canPrint']
                                ? Colors.green
                                : Colors.grey,
                            minimumSize: const Size(double.infinity, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Print',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
