import 'package:flutter/material.dart';

class TentangAplikasiPage extends StatelessWidget {
  const TentangAplikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Nusantara Cerdas')),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nusantara Cerdas Mobile v2.1.0', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Aplikasi Resmi Layanan Warga Terpadu Pemerintahan Kota Nusantara.'),
            SizedBox(height: 12),
            Text('Dibangun menggunakan arsitektur Flutter Material 3 yang adaptif terhadap perangkat ponsel maupun layar lobi perkantoran.'),
          ],
        ),
      ),
    );
  }
}