import 'package:flutter/material.dart';

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontak Kami', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF0284C7),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tetap Bersama Kami', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Hubungi Kami', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
            const SizedBox(height: 8),
            const Text('Jangan ragu untuk meminta bantuan atau bertanya langsung kepada tim operasional PandeglangTrip.', style: TextStyle(fontSize: 13, color: Colors.grey)),
            const SizedBox(height: 20),
            // Kartu Info Kontak
            Card(
              color: const Color(0xFFF0F9FF),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.location_on, color: Color(0xFF0284C7)),
                      title: Text('Tempat Kami', style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Kabupaten Pandeglang, Banten'),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.email, color: Color(0xFF0284C7)),
                      title: Text('Email Resmi', style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('pandeglangtrip@gmail.com'),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.phone, color: Color(0xFF0284C7)),
                      title: Text('Hotline Telepon', style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('(+62) 123 456 789'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Form Kirim Pesan
            const Text('Kirim Pesan', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Tulis pesan Anda...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0284C7),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pesan Anda berhasil dikirim ke tim dukungan!')),
                  );
                },
                child: const Text('SEND MESSAGE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}