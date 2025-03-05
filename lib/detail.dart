import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio Detail'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto Profil dengan Animasi dari Atas ke Bawah
            Center(
              child: Animate(
                effects: [FadeEffect(duration: 600.ms), SlideEffect(begin: Offset(0, -1), end: Offset(0, 0))],
                child: const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/puril.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Nama dan Posisi
            _buildAnimatedCard(
              delay: 300,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Muhamad Fachril Alrizky',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    'Programmer',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Contact Information
            _buildAnimatedCard(
              delay: 400,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contact', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text('Kab. Bogor Cigombong Wates Jaya', style: TextStyle(color: Colors.white70)),
                  Text('muhamadfachrilalrizky1@gmail.com', style: TextStyle(color: Colors.white70)),
                  Text('+62-895-4020-70805', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // About Me
            _buildAnimatedCard(
              delay: 500,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About Me', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text(
                    'Saya seorang pelajar yang ingin mengembangkan diri di bidang Website Dev junior. Saya cepat untuk beradaptasi dalam berbagai hal serta saya dapat bekerja dalam suatu tim.',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Skills
            _buildAnimatedCard(
              delay: 600,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Skills', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text('Django, Laravel, React.js, Vue.js, Python, Flutter, Github', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Education
            _buildAnimatedCard(
              delay: 700,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Education', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text('2020-2023: SMPN 7 Bogor', style: TextStyle(color: Colors.white70)),
                  Text('2024-2026: SMK Wikrama Bogor', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Portfolio Projects
            _buildAnimatedCard(
              delay: 800,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Portfolio Projects', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                  ListTile(
                    title: const Text('Hospital - Fasilitas Rumah Sakit', style: TextStyle(color: Colors.white)),
                    subtitle: const Text('Pengaduan Masyarakat - Kritik dan Saran', style: TextStyle(color: Colors.white70)),
                  ),
                  ListTile(
                    title: const Text('My Portfolio Website', style: TextStyle(color: Colors.white)),
                    subtitle: const Text('Click to view', style: TextStyle(color: Colors.white70)),
                    trailing: const Icon(Icons.open_in_new, color: Colors.white),
                    onTap: () async {
                      final Uri url = Uri.parse('https://fachrilal.github.io/Portofolio/');
                      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  // Fungsi untuk membuat Card dengan animasi selang-seling
  Widget _buildAnimatedCard({required int delay, required Widget child}) {
    bool isLeft = delay.isEven;
    return Animate(
      effects: [
        FadeEffect(duration: 600.ms),
        SlideEffect(begin: Offset(isLeft ? -1 : 1, 0), end: Offset(0, 0)),
      ],
      delay: delay.ms,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
