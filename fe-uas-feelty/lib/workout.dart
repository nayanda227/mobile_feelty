import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uts_feelty/gnavbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none, // Agar stack tidak overflow
              children: [
                // Header dengan ClipPath
                ClipPath(
                  clipper: MyCustomClipper(),
                  clipBehavior:
                  Clip.hardEdge, // Tambahkan untuk mengatasi overflow
                  child: Container(
                    height: 300,
                    color: Colors.orange,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50), // Jarak dari atas
                        const Text(
                          'Hi, Jungkook Jeon',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Workout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child:
                                  Icon(Icons.person, color: Colors.orange),
                                ),
                                const SizedBox(width: 20),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                  child: SvgPicture.asset(
                                      'assets/icons/profilepict.svg'),
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              'assets/icons/notifikasi.svg',
                              height: 24,
                              width: 24,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Konten "Week Goal" yang menumpuk sebagian di atas header
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Bagian Week Goal dan Lose Weight
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Week Goal',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/icons/edit-02.svg', // Tambahkan SVG di sebelah judul
                                height: 24,
                                width: 24,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Hari dalam seminggu
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(7, (index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: index == 2
                                      ? Colors.white
                                      : Colors.orange[800],
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  '${16 + index}',
                                  style: TextStyle(
                                    color: index == 2
                                        ? Colors.deepOrange
                                        : Colors.white,
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 16),
                          // Konten Lose Weight di dalam box Week Goal
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Sisi Kiri: Konten Lose Weight
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    children: [
                                      // Konten di Sisi Kiri
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/arrow-switch-horizontal.svg',
                                              height: 12,
                                              width: 12,
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              'LOSE WEIGHT',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            SvgPicture.asset(
                                              'assets/icons/bar.svg', // SVG antara teks
                                              height: 15,
                                              width: 7,
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              '18 days left',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Container(
                                              padding:
                                              const EdgeInsets.symmetric(
                                                horizontal: 16,
                                                vertical: 8,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.orange,
                                                borderRadius:
                                                BorderRadius.circular(16),
                                              ),
                                              child: const Text(
                                                'Day 10',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                          width:
                                          16), // Jarak antara konten dan gambar
                                      SizedBox(
                                        width: 136,
                                        height: 136,
                                        child: SvgPicture.asset(
                                          'assets/icons/content-right.svg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Jarak tambahan agar konten lebih rapi
            const SizedBox(height: 140),

            // Konten tambahan setelah "Week Goal"
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Container(
                    width: 382, // Ukuran box
                    height: 108, // Ukuran box
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      // Menggunakan Row untuk menempatkan SizedBox dan gambar di samping
                      children: [
                        const SizedBox(
                          width: 156, // Ukuran SizedBox
                          height: 55, // Ukuran SizedBox
                          child: Text(
                            'Track Your Outdoor Activities',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 92,
                          height: 93,
                          child: Image.asset(
                            // Menambahkan gambar PNG di sebelah kanan
                            'assets/images/sepatu.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'CHALLENGE',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              width: 350,
                              height: 216,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors
                                    .grey[200], // Keep the background color
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Daily',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  // Gambar yang sebelumnya berada di persegi panjang oranye
                                  Container(
                                    width: 115,
                                    height: 156,
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/images/panah.png', // Ganti dengan path gambar Anda
                                      width: 142,
                                      height: 142,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              width: 350,
                              height: 216,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey[
                                200], // Warna latar belakang tetap ada
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Weekly',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Container(
                                    width: 115,
                                    height: 156,
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/images/panah.png',
                                      width: 142,
                                      height: 142,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'BODY FOCUS',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildBodyFocusCard(
                            'Arm Workout', Icons.fitness_center, 180, 183),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildBodyFocusCard(
                            'Chest Workout', Icons.fitness_center, 180, 183),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildBodyFocusCard(
                            'Abs Workout', Icons.fitness_center, 180, 183),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildBodyFocusCard(
                            'Shoulder Workout', Icons.fitness_center, 180, 183),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildBodyFocusCard(
                            'Leg Workout', Icons.fitness_center, 180, 160),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'ARTICLES FOR YOU',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: _buildArticleCard(
                            'How to reduce stress in workout',
                            'assets/icons/Artikel1.svg'),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildArticleCard(
                            'How to manage weight in 2 weeks',
                            'assets/images/Artikel2.png'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyFocusCard(
      String title, IconData icon, double height, double width) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/${title.toLowerCase().replaceAll(' ', '_')}.svg',
            height: 80,
            width: 80,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleCard(String title, String assetPath) {
    bool isSvg = assetPath.endsWith('.svg');
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          isSvg
              ? SvgPicture.asset(
            assetPath, // Untuk SVG
            width: 120,
            height: 120,
          )
              : Image.asset(
            assetPath, // Untuk gambar biasa
            width: 120,
            height: 120,
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.orange),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.8);
    var firstControlPoint = Offset(size.width * 0.5, size.height);
    var firstEndPoint = Offset(size.width, size.height * 0.8);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
