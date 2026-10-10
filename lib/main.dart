import 'package:flutter/material.dart';

void main() {
  runApp(const KartuProfilApp());
}

const Color ungu = Color(0xFF6655D9);
const Color biruTua = Color(0xFF29234F);
const Color latar = Color(0xFFF4F2FC);

class KartuProfilApp extends StatelessWidget {
  const KartuProfilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kartu Profil',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: ungu),
      ),
      home: const HalamanProfil(),
    );
  }
}

class HalamanProfil extends StatelessWidget {
  const HalamanProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: latar,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final layarLebar = constraints.maxWidth > 600;

            return SingleChildScrollView(
              padding: EdgeInsets.all(layarLebar ? 32 : 16),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 900),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: ungu.withOpacity(0.12),
                        blurRadius: 28,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Banner profil
                      Container(
                        height: layarLebar ? 190 : 150,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF24B6C7),
                              Color(0xFF5578E9),
                              Color(0xFF8560DD),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: -30,
                              top: -80,
                              child: Container(
                                width: 210,
                                height: 210,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.12),
                                ),
                              ),
                            ),
                            const Positioned(
                              right: 20,
                              top: 22,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'MY PROFILE',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  Text(
                                    'Learn • Build • Grow',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Foto dan identitas
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          layarLebar ? 30 : 20,
                          0,
                          layarLebar ? 30 : 20,
                          28,
                        ),
                        child: Transform.translate(
                          offset: const Offset(0, -38),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (layarLebar)
                                const Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FotoProfil(),
                                    SizedBox(width: 28),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 50),
                                        child: InformasiProfil(),
                                      ),
                                    ),
                                  ],
                                )
                              else
                                const Column(
                                  children: [
                                    FotoProfil(),
                                    SizedBox(height: 18),
                                    InformasiProfil(),
                                  ],
                                ),

                              const SizedBox(height: 10),
                              const Divider(color: Color(0xFFE8E4F3)),
                              const SizedBox(height: 22),

                              const JudulBagian(
                                ikon: Icons.person_outline,
                                judul: 'Tentang Saya',
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                'Saya adalah mahasiswa Sistem Informasi. '
                                'Saya memiliki minat dalam bidang UI Design, '
                                'videografer, infografis, dan database.',
                                style: TextStyle(
                                  color: Color(0xFF6E6B7D),
                                  fontSize: 14,
                                  height: 1.8,
                                ),
                              ),

                              const SizedBox(height: 26),

                              const JudulBagian(
                                ikon: Icons.code_rounded,
                                judul: 'Keahlian Saya',
                              ),
                              const SizedBox(height: 14),

                              const Wrap(
                                spacing: 9,
                                runSpacing: 10,
                                children: [
                                  ChipKeahlian(
                                    ikon: Icons.palette_outlined,
                                    teks: 'UI Design',
                                  ),
                                  ChipKeahlian(
                                    ikon: Icons.videocam_outlined,
                                    teks: 'Videografi',
                                  ),
                                  ChipKeahlian(
                                    ikon: Icons.insert_chart_outlined,
                                    teks: 'Infografis',
                                  ),
                                  ChipKeahlian(
                                    ikon: Icons.storage_rounded,
                                    teks: 'Database',
                                  ),
                                ],
                              ),

                              const SizedBox(height: 28),

                              const JudulBagian(
                                ikon: Icons.connect_without_contact,
                                judul: 'Hubungi Saya',
                              ),
                              const SizedBox(height: 14),

                              LayoutBuilder(
                                builder: (context, area) {
                                  final horizontal =
                                      area.maxWidth > 550;

                                  const kontak = [
                                    KartuKontak(
                                      ikon: Icons.email_outlined,
                                      judul: 'Email',
                                      keterangan: 'Email pribadi',
                                    ),
                                    KartuKontak(
                                      ikon: Icons.phone_outlined,
                                      judul: 'Telepon',
                                      keterangan: 'Nomor kontak',
                                    ),
                                    KartuKontak(
                                      ikon: Icons.code_rounded,
                                      judul: 'GitHub',
                                      keterangan: 'Profil GitHub',
                                    ),
                                  ];

                                  if (horizontal) {
                                    return Row(
                                      children: [
                                        Expanded(child: kontak[0]),
                                        const SizedBox(width: 12),
                                        Expanded(child: kontak[1]),
                                        const SizedBox(width: 12),
                                        Expanded(child: kontak[2]),
                                      ],
                                    );
                                  }

                                  return Column(
                                    children: [
                                      kontak[0],
                                      const SizedBox(height: 10),
                                      kontak[1],
                                      const SizedBox(height: 10),
                                      kontak[2],
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FotoProfil extends StatelessWidget {
  const FotoProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: ungu, width: 3),
              boxShadow: [
                BoxShadow(
                  color: ungu.withOpacity(0.15),
                  blurRadius: 16,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/foto_profil.jpg',
                width: 125,
                height: 125,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 125,
                    height: 125,
                    color: const Color(0xFFEAE5FF),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.person_rounded,
                      color: ungu,
                      size: 78,
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            right: -10,
            bottom: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF20A65A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: const Text(
                'Available',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InformasiProfil extends StatelessWidget {
  const InformasiProfil({super.key});

  @override
  Widget build(BuildContext context) {
    final layarLebar = MediaQuery.of(context).size.width > 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nela Ulivatul Zahro Maulana',
          style: TextStyle(
            fontSize: layarLebar ? 29 : 25,
            fontWeight: FontWeight.w800,
            color: biruTua,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Mahasiswa Sistem Informasi',
          style: TextStyle(
            color: ungu,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        const Wrap(
          spacing: 14,
          runSpacing: 8,
          children: [
            LabelInfo(
              ikon: Icons.school_outlined,
              teks: 'Semester 5',
            ),
            LabelInfo(
              ikon: Icons.account_balance_outlined,
              teks: 'UNIPDU Jombang',
            ),
          ],
        ),
      ],
    );
  }
}

class LabelInfo extends StatelessWidget {
  final IconData ikon;
  final String teks;

  const LabelInfo({
    super.key,
    required this.ikon,
    required this.teks,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(ikon, size: 18, color: ungu),
        const SizedBox(width: 6),
        Text(
          teks,
          style: const TextStyle(
            color: Color(0xFF5F5B77),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class JudulBagian extends StatelessWidget {
  final IconData ikon;
  final String judul;

  const JudulBagian({
    super.key,
    required this.ikon,
    required this.judul,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFEDE9FF),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Icon(ikon, color: ungu, size: 21),
        ),
        const SizedBox(width: 11),
        Text(
          judul,
          style: const TextStyle(
            color: biruTua,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class ChipKeahlian extends StatelessWidget {
  final IconData ikon;
  final String teks;

  const ChipKeahlian({
    super.key,
    required this.ikon,
    required this.teks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 11,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF1EEFF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2DCFF)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(ikon, color: ungu, size: 18),
          const SizedBox(width: 7),
          Text(
            teks,
            style: const TextStyle(
              color: biruTua,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class KartuKontak extends StatelessWidget {
  final IconData ikon;
  final String judul;
  final String keterangan;

  const KartuKontak({
    super.key,
    required this.ikon,
    required this.judul,
    required this.keterangan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F6FF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEAE5FF)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFEAE5FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(ikon, color: ungu, size: 22),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: const TextStyle(
                    color: biruTua,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  keterangan,
                  style: const TextStyle(
                    color: Color(0xFF77748A),
                    fontSize: 11,
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