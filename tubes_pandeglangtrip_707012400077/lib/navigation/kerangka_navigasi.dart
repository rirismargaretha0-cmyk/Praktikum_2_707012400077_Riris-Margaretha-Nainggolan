import 'package:flutter/material.dart';
import '../pages/beranda_page.dart';
import '../pages/tur_page.dart';
import '../pages/tiket_page.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() => _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int _indeksTujuanAktif = 0;

  final List<Widget> _daftarHalamanUtama = const [
    BerandaPage(),
    TurPage(),
    TiketPage(),
  ];

  final List<String> _judulHalaman = [
    'Eksplor Pandeglang',
    'Kategori Tur Wisata',
    'Aktivitas Tiket Saya',
  ];

  void _pilihTujuan(int index) {
    setState(() {
      _indeksTujuanAktif = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _indeksTujuanAktif == 0,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) return;
        setState(() {
          _indeksTujuanAktif = 0;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _judulHalaman[_indeksTujuanAktif],
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
          ),
          backgroundColor: const Color(0xFF0284C7),
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 1,
          actions: [
            IconButton(
              tooltip: 'Uji Rute 404',
              icon: const Icon(Icons.bug_report_outlined),
              onPressed: () {
                Navigator.pushNamed(context, '/rute-salah-pandeglang');
              },
            ),
          ],
        ),
        drawer: _bangunDrawer(context),
        body: IndexedStack(
          index: _indeksTujuanAktif,
          children: _daftarHalamanUtama,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _indeksTujuanAktif,
          onDestinationSelected: _pilihTujuan,
          elevation: 3,
          indicatorColor: const Color(0xFFE0F2FE),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.explore_outlined),
              selectedIcon: Icon(Icons.explore, color: Color(0xFF0284C7)),
              label: 'Eksplor',
            ),
            NavigationDestination(
              icon: Icon(Icons.tour_outlined),
              selectedIcon: Icon(Icons.tour, color: Color(0xFF0284C7)),
              label: 'Kategori Tur',
            ),
            NavigationDestination(
              icon: Icon(Icons.confirmation_number_outlined),
              selectedIcon: Icon(Icons.confirmation_number, color: Color(0xFF0284C7)),
              label: 'Tiket Saya',
            ),
          ],
        ),
      ),
    );
  }

  Widget _bangunDrawer(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: _indeksTujuanAktif,
      onDestinationSelected: (int index) {
        if (index <= 2) {
          setState(() {
            _indeksTujuanAktif = index;
          });
          Navigator.pop(context);
        }
      },
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
          color: const Color(0xFF0284C7),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PandeglangTrip',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Portal Wisata Terpadu Kab. Pandeglang',
                style: TextStyle(color: Color(0xFFE0F2FE), fontSize: 12),
              ),
            ],
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.explore_outlined),
          selectedIcon: Icon(Icons.explore),
          label: Text('Beranda Wisata'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.tour_outlined),
          selectedIcon: Icon(Icons.tour),
          label: Text('Kategori Tur'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.confirmation_number_outlined),
          selectedIcon: Icon(Icons.confirmation_number),
          label: Text('Tiket Saya'),
        ),
        const Divider(indent: 16, endIndent: 16),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 8, 28, 8),
          child: Text('Bantuan & Informasi', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 28),
          leading: const Icon(Icons.help_outline),
          title: const Text('FAQ Pertanyaan'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/bantuan/faq');
          },
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 28),
          leading: const Icon(Icons.support_agent_outlined),
          title: const Text('Kontak Kami'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/bantuan/kontak');
          },
        ),
        const Divider(indent: 16, endIndent: 16),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 28),
          leading: const Icon(Icons.logout, color: Colors.redAccent),
          title: const Text('Keluar Akun', style: TextStyle(color: Colors.redAccent)),
          onTap: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Anda telah keluar dari akun.')),
            );
          },
        ),
      ],
    );
  }
}