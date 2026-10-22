import 'package:flutter/material.dart';

class RouteTidakDikenalPage extends StatelessWidget {
  final String? namaRoute;

  const RouteTidakDikenalPage({super.key, this.namaRoute});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Tidak Ditemukan'),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline_rounded, size: 72, color: Colors.amber),
              const SizedBox(height: 16),
              const Text(
                'Alamat Rute Salah atau Tidak Ditemukan',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Sistem tidak menemukan rute untuk "${namaRoute ?? 'Unknown'}". '
                'Pastikan penamaan rute pada kode telah sesuai dengan daftar di AppRoutes.',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey, fontSize: 13, height: 1.5),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali ke Halaman Sebelumnya'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

