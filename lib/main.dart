import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const DashboardApp());
}

class DashboardApp extends StatelessWidget {
  const DashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          surface: const Color(0xFF0F1123),
          primary: const Color(0xFF6C63FF),
          secondary: const Color(0xFF00D9FF),
          tertiary: const Color(0xFFFF6B9D),
          onSurface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFF0F1123),
        textTheme: GoogleFonts.interTextTheme(
          ThemeData.dark().textTheme,
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}
