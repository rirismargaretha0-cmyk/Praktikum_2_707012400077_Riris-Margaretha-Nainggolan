import 'package:flutter/material.dart';
import '../navigation/app_routes.dart';

class LayananPage extends StatelessWidget {
  const LayananPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengatur kontrol navigasi tab dengan 3 kategori
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Material(
            color: Theme.of(context).colorScheme.surface,
            elevation: 1,
            child: const TabBar(
              indicatorWeight: 3,
              labelColor: Color(0xFF0D9488),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(icon: Icon(Icons.assignment_outlined), text: 'Perizinan'),
                Tab(icon: Icon(Icons.local_hospital_outlined), text: 'Kesehatan'),
                Tab(icon: Icon(Icons.directions_bus_outlined), text: 'Transportasi'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Tab 1: Kategori Perizinan
                _bangunDaftarLayanan(context, 'Perizinan', [
                  {
                    'nama': 'Izin Mendirikan Bangunan (IMB/PBG)',
                    'dinas': 'Dinas Penanaman Modal & PTSP',
                    'jam': '08:00 - 15:00 WIB',
                    'ket': 'Pengajuan perizinan pendirian bangunan hunian dan komersial berbasis tata ruang kota.'
                  },
                  {
                    'nama': 'Surat Izin Usaha Mikro & Kecil (IUMK)',
                    'dinas': 'Dinas Koperasi dan UMKM',
                    'jam': '08:30 - 14:30 WIB',
                    'ket': 'Pemberian legalitas kepada pelaku usaha mikro dan kecil untuk fasilitasi perbankan.'
                  },
                  {
                    'nama': 'Izin Penyelenggaraan Reklame Kota',
                    'dinas': 'Badan Pengelolaan Pendapatan Daerah',
                    'jam': '09:00 - 15:00 WIB',
                    'ket': 'Registrasi dan penertiban lokasi pemasangan media promosi luar ruang pada koridor jalan kota.'
                  },
                ]),
                // Tab 2: Kategori Kesehatan
                _bangunDaftarLayanan(context, 'Kesehatan', [
                  {
                    'nama': 'Telemedisin & Reservasi Puskesmas',
                    'dinas': 'Dinas Kesehatan Kota Nusantara',
                    'jam': '24 Jam (Darurat) / 08:00 - 14:00 WIB',
                    'ket': 'Antrean digital rawat jalan dan konsultasi dokter puskesmas secara daring.'
                  },
                  {
                    'nama': 'Fasilitasi Jaminan Kesehatan Warga',
                    'dinas': 'Dinas Sosial & Dinas Kesehatan',
                    'jam': '08:00 - 15:00 WIB',
                    'ket': 'Verifikasi kepesertaan bantuan iuran jaminan kesehatan bagi keluarga pra-sejahtera.'
                  },
                  {
                    'nama': 'Layanan Vaksinasi & Imunisasi Anak',
                    'dinas': 'Pusat Pelayanan Terpadu Kelurahan',
                    'jam': '08:00 - 12:00 WIB',
                    'ket': 'Jadwal pemberian imunisasi dasar wajib dan vaksinasi booster balita warga kota.'
                  },
                ]),
                // Tab 3: Kategori Transportasi
                _bangunDaftarLayanan(context, 'Transportasi', [
                  {
                    'nama': 'Aktivasi Tiket Langganan Smart Bus',
                    'dinas': 'Dinas Perhubungan Kota Nusantara',
                    'jam': '06:00 - 21:00 WIB',
                    'ket': 'Integrasi kartu identitas digital dengan armada bus raya terpadu dan angkutan pengumpan.'
                  },
                  {
                    'nama': 'Uji Emisi Kendaraan Berkala (KIR)',
                    'dinas': 'UPT Pengujian Kendaraan Bermotor',
                    'jam': '08:00 - 14:00 WIB',
                    'ket': 'Pengujian kelaikan jalan dan baku mutu emisi gas buang kendaraan roda empat/niaga.'
                  },
                  {
                    'nama': 'Pengaduan Parkir Liar & Rambu Rusak',
                    'dinas': 'Command Center Dishub',
                    'jam': '24 Jam Monitoring',
                    'ket': 'Pelaporan hambatan lalu lintas, rambu jalan rusak, dan penertiban parkir fasilitas umum.'
                  },
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi pembangun daftar kartu per tab
  Widget _bangunDaftarLayanan(BuildContext context, String kategori, List<Map<String, String>> layananList) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: layananList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = layananList[index];
        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: CircleAvatar(
              backgroundColor: const Color(0xFFE6FFFA),
              child: Icon(
                kategori == 'Perizinan'
                    ? Icons.description
                    : kategori == 'Kesehatan'
                        ? Icons.health_and_safety
                        : Icons.directions_transit,
                color: const Color(0xFF0D9488),
              ),
            ),
            title: Text(item['nama']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text('${item['dinas']} • ${item['jam']}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () async {
              // 1. Membuka halaman rincian dengan named route sambil mengirim arguments
              // 2. Menunggu nilai balik dikembalikan melalui await
              final hasilPengajuan = await Navigator.pushNamed(
                context,
                AppRoutes.rincianLayanan,
                arguments: {
                  'namaLayanan': item['nama'],
                  'dinas': item['dinas'],
                  'jamOperasional': item['jam'],
                  'keterangan': item['ket'],
                },
              );

              // 3. Menampilkan SnackBar jika terdapat pesan kembalian dari halaman rincian
              if (hasilPengajuan != null && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(hasilPengajuan.toString()),
                    backgroundColor: const Color(0xFF0F766E),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    action: SnackBarAction(
                      label: 'TUTUP',
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}