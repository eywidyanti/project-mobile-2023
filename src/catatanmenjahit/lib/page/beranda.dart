import 'package:catatanmenjahit/page/catatan/catatan.dart';
import 'package:catatanmenjahit/page/koleksi/koleksi.dart';
import 'package:catatanmenjahit/page/profil/profil.dart';
import 'package:flutter/material.dart';

import 'bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;

  final List<Widget> _screens = [
    const KoleksiPage(),
    const CatatanPage(),
    const ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Catatan Jahitan',
            style: TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 170, 219, 113),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.collections_rounded),
            title: const Text("Koleksi"),
            selectedColor: const Color.fromARGB(255, 3, 201, 106),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.note_alt_outlined),
            title: const Text("Catatan"),
            selectedColor: Colors.lightGreen,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profil"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
