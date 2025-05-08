import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🌄 Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFB0C4DE), Color(0xFF4B6274)],
              ),
            ),
          ),

          // ☀️ Matahari
          Positioned(
            top: 80,
            left: 50,
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orangeAccent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange,
                    blurRadius: 40,
                    spreadRadius: 10,
                  )
                ],
              ),
            ),
          ),

          // 🏔️ Siluet Gunung
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: MountainClipper(),
              child: Container(
                height: 200,
                color: const Color(0xFF2F4F4F),
              ),
            ),
          ),

          // 🌲 Pohon-Pohon
          Positioned(
            bottom: 50,
            left: 30,
            child: Icon(Icons.park, size: 40, color: Colors.black87),
          ),
          Positioned(
            bottom: 60,
            left: 80,
            child: Icon(Icons.park, size: 50, color: Colors.black54),
          ),
          Positioned(
            bottom: 40,
            right: 60,
            child: Icon(Icons.park, size: 60, color: Colors.black87),
          ),

          // 🌤️ Informasi Cuaca
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Harlem',
                  style: GoogleFonts.roboto(
                    fontSize: 36,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Tuesday, Januar 10, 2019',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  '15°C',
                  style: GoogleFonts.roboto(
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 200,
                  height: 2,
                  color: Colors.white24,
                ),
                const SizedBox(height: 24),
                Text(
                  'Cloudy',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '25°C / 28°C',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 🔻 Custom Clipper untuk bentuk gunung
class MountainClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 30);
    path.lineTo(size.width * 0.25, size.height - 80);
    path.lineTo(size.width * 0.5, size.height - 30);
    path.lineTo(size.width * 0.75, size.height - 100);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}