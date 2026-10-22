import 'package:flutter/material.dart';
import '../pages/faq_page.dart';
import '../pages/kontak_page.dart';
import '../pages/detail_wisata_page.dart';
import '../pages/pembayaran_page.dart';
import '../pages/route_tidak_dikenal_page.dart';
import 'kerangka_navigasi.dart';

class AppRoutes {
  static const String beranda = '/';
  static const String detailWisata = '/wisata/detail';
  static const String pembayaran = '/wisata/pembayaran';
  static const String faq = '/bantuan/faq';
  static const String kontak = '/bantuan/kontak';

  static Map<String, WidgetBuilder> get daftarRoute {
    return {
      beranda: (context) => const KerangkaNavigasi(),
      faq: (context) => const FaqPage(),
      kontak: (context) => const KontakPage(),
    };
  }

  static Route<dynamic>? bentukRoute(RouteSettings settings) {
    if (settings.name == detailWisata) {
      final args = settings.arguments as Map<String, dynamic>?;
      return MaterialPageRoute(
        builder: (context) => DetailWisataPage(
          namaDestinasi: args?['nama'] ?? 'Destinasi Wisata',
          lokasi: args?['lokasi'] ?? 'Pandeglang, Banten',
          harga: args?['harga'] ?? 'Rp 0',
          rating: args?['rating'] ?? '5.0',
          deskripsi: args?['deskripsi'] ?? 'Deskripsi tidak tersedia.',
          jamBuka: args?['jam'] ?? '08:00 - 17:00 WIB',
        ),
        settings: settings,
      );
    } else if (settings.name == pembayaran) {
      final args = settings.arguments as Map<String, dynamic>?;
      return MaterialPageRoute(
        builder: (context) => PembayaranPage(
          namaDestinasi: args?['nama'] ?? 'Destinasi',
          totalBayar: args?['harga'] ?? 'Rp 0',
        ),
        settings: settings,
      );
    }
    return null;
  }

  static Route<dynamic> routeTidakDikenal(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => RouteTidakDikenalPage(namaRoute: settings.name),
      settings: settings,
    );
  }
}