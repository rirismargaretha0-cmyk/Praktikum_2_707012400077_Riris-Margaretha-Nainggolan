import 'package:flutter/material.dart';
import 'app_routes.dart';
import '../pages/beranda_page.dart';
import '../pages/layanan_page.dart';
import '../pages/warga_page.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() => _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  // Variabel penanda indeks menu utama yang sedang aktif di layar
  int _indeksTujuanAktif = 0;

  // Daftar tiga halaman utama yang saling bertukar isi
  final List<Widget> _daftarHalamanUtama = const [
    BerandaPage(),
    LayananPage(),
    WargaPage(),
  ];

  // Judul dinamis pada AppBar menyesuaikan menu yang sedang aktif
  final List<String> _judulHalaman = [
    'Dasbor Nusantara Cerdas',
    'Katalog Layanan Publik',
    'Portofolio Warga Digital',
  ];

  void _pilihTujuan(int index) {
    setState(() {
      _indeksTujuanAktif = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Mengevaluasi ambang batas ukuran layar 600 piksel logis (responsivitas)
    final bool isLayarLebar = MediaQuery.of(context).size.width >= 600;

    return PopScope(
      canPop: _indeksTujuanAktif == 0,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) return;
        // Jika tombol kembali perangkat ditekan di menu selain Beranda, alihkan ke Beranda
        setState(() {
          _indeksTujuanAktif = 0;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _judulHalaman[_indeksTujuanAktif],
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.surface,
          actions: [
            // Tombol uji coba untuk memverifikasi penanganan rute tidak dikenal (404)
            IconButton(
              tooltip: 'Uji Route 404',
              icon: const Icon(Icons.bug_report_outlined),
              onPressed: () {
                Navigator.pushNamed(context, '/rute-salah-yang-tidak-ada');
              },
            ),
          ],
        ),
        drawer: _bangunNavigationDrawer(context),
        body: isLayarLebar
            ? Row(
                children: [
                  // Tampilan bilah navigasi vertikal di sisi kiri pada layar lebar (>=600px)
                  NavigationRail(
                    selectedIndex: _indeksTujuanAktif,
                    onDestinationSelected: _pilihTujuan,
                    labelType: NavigationRailLabelType.all,
                    leading: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: const Icon(Icons.location_city, color: Colors.white),
                      ),
                    ),
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(Icons.dashboard_outlined),
                        selectedIcon: Icon(Icons.dashboard),
                        label: Text('Beranda'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.miscellaneous_services_outlined),
                        selectedIcon: Icon(Icons.miscellaneous_services),
                        label: Text('Layanan'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.person_outline),
                        selectedIcon: Icon(Icons.person),
                        label: Text('Warga'),
                      ),
                    ],
                  ),
                  const VerticalDivider(thickness: 1, width: 1),
                  Expanded(
                    child: IndexedStack(
                      index: _indeksTujuanAktif,
                      children: _daftarHalamanUtama,
                    ),
                  ),
                ],
              )
            : IndexedStack(
                index: _indeksTujuanAktif,
                children: _daftarHalamanUtama,
              ),
        // Bilah navigasi bawah hanya dirender jika layar sempit (<600px)
        bottomNavigationBar: isLayarLebar
            ? null
            : NavigationBar(
                selectedIndex: _indeksTujuanAktif,
                onDestinationSelected: _pilihTujuan,
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.dashboard_outlined),
                    selectedIcon: Icon(Icons.dashboard),
                    label: 'Beranda',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.miscellaneous_services_outlined),
                    selectedIcon: Icon(Icons.miscellaneous_services),
                    label: 'Layanan',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person_outline),
                    selectedIcon: Icon(Icons.person),
                    label: 'Warga',
                  ),
                ],
              ),
      ),
    );
  }

  // Pembangun menu samping (NavigationDrawer)
  Widget _bangunNavigationDrawer(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: _indeksTujuanAktif,
      onDestinationSelected: (int index) {
        if (index <= 2) {
          setState(() {
            _indeksTujuanAktif = index;
          });
          Navigator.pop(context); // Menutup panel drawer
        }
      },
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 20, 16, 10),
          child: Row(
            children: [
              Icon(Icons.apartment_rounded, color: Theme.of(context).colorScheme.primary, size: 28),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nusantara Cerdas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text('Layanan Warga Terpadu', style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
        const Divider(indent: 16, endIndent: 16),
        const NavigationDrawerDestination(
          icon: Icon(Icons.dashboard_outlined),
          selectedIcon: Icon(Icons.dashboard),
          label: Text('Beranda Kota'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.miscellaneous_services_outlined),
          selectedIcon: Icon(Icons.miscellaneous_services),
          label: Text('Daftar Layanan'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: Text('Identitas Warga'),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 8),
          child: Text('Menu Pendukung', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 28),
          leading: const Icon(Icons.tune_outlined),
          title: const Text('Pengaturan Kota'),
          onTap: () {
            Navigator.pop(context); // Menutup panel samping terlebih dahulu
            Navigator.pushNamed(context, AppRoutes.pengaturanKota);
          },
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 28),
          leading: const Icon(Icons.info_outline),
          title: const Text('Tentang Aplikasi'),
          onTap: () {
            Navigator.pop(context); // Menutup panel samping terlebih dahulu
            Navigator.pushNamed(context, AppRoutes.tentangAplikasi);
          },
        ),
        const Divider(indent: 16, endIndent: 16),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 28),
          leading: const Icon(Icons.logout, color: Colors.redAccent),
          title: const Text('Keluar Sistem', style: TextStyle(color: Colors.redAccent)),
          onTap: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Sesi pengguna dinonaktifkan sementara.')),
            );
          },
        ),
      ],
    );
  }
}