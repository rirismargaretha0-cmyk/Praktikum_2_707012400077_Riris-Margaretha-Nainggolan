import 'package:flutter/material.dart';
import '../pages/beranda_page.dart';
import '../pages/layanan_page.dart';
import '../pages/warga_page.dart';
import '../pages/rincian_layanan_page.dart';
import '../pages/riwayat_laporan_page.dart';
import '../pages/pengaturan_kota_page.dart';
import '../pages/tentang_aplikasi_page.dart';
import '../pages/route_tidak_dikenal_page.dart';
import 'kerangka_navigasi.dart';

class AppRoutes {
  // 1. Konstanta String Alamat Rute
  static const String beranda = '/';
  static const String rincianLayanan = '/layanan/rincian';
  static const String riwayatLaporan = '/warga/riwayat-laporan';
  static const String pengaturanKota = '/pengaturan-kota';
  static const String tentangAplikasi = '/tentang-aplikasi';

  // 2. Pemetaan Rute Statis Tanpa Parameter
  static Map<String, WidgetBuilder> get daftarRoute {
    return {
      beranda: (context) => const KerangkaNavigasi(),
      pengaturanKota: (context) => const PengaturanKotaPage(),
      tentangAplikasi: (context) => const TentangAplikasiPage(),
      riwayatLaporan: (context) => const RiwayatLaporanPage(),
    };
  }

  // 3. Generator Rute Dinamis yang Menerima Data Arguments
  static Route<dynamic>? bentukRoute(RouteSettings settings) {
    if (settings.name == rincianLayanan) {
      final args = settings.arguments as Map<String, dynamic>?;
      return MaterialPageRoute(
        builder: (context) => RincianLayananPage(
          namaLayanan: args?['namaLayanan'] ?? 'Layanan Tidak Ditemukan',
          dinas: args?['dinas'] ?? 'Dinas Terkait',
          jamOperasional: args?['jamOperasional'] ?? '08:00 - 15:00 WIB',
          keterangan: args?['keterangan'] ?? 'Tidak ada deskripsi layanan.',
        ),
        settings: settings,
      );
    }
    return null;
  }

  // 4. Penanganan Fallback Saat Rute Tidak Ditemukan (Error 404)
  static Route<dynamic> routeTidakDikenal(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => RouteTidakDikenalPage(namaRoute: settings.name),
      settings: settings,
    );
  }
}

