import 'package:flutter/material.dart';

import 'widget/image_detail.dart';

class FemalePage extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/img/hitam.jpeg',
    'assets/img/cream.jpeg',
    'assets/img/slik.jpeg',
    'assets/img/dress.jpeg',
    'assets/img/sage.jpeg',
    'assets/img/hitampita.jpeg',
    'assets/img/coklat.jpeg',
  ];

  FemalePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Koleksi Pakaian Wanita',
            style: TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 170, 219, 113),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Jumlah kolom dalam grid
        children: List.generate(imageUrls.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return ImageDetailPage(imageUrl: imageUrls[index]);
                }));
              },
              child: Hero(
                tag: imageUrls[index],
                child: Image.asset(
                  imageUrls[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
