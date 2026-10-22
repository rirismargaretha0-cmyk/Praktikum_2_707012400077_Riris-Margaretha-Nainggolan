import 'package:flutter/material.dart';
import 'navigation/app_routes.dart';

void main() {
  runApp(const PandeglangTripApp());
}

class PandeglangTripApp extends StatelessWidget {
  const PandeglangTripApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PandeglangTrip',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0284C7),
          brightness: Brightness.light,
        ),
      ),
      initialRoute: AppRoutes.beranda,
      routes: AppRoutes.daftarRoute,
      onGenerateRoute: AppRoutes.bentukRoute,
      onUnknownRoute: AppRoutes.routeTidakDikenal,
    );
  }
}