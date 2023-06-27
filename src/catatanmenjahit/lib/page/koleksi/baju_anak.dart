import 'package:flutter/material.dart';

import 'widget/image_detail.dart';

class ChildPage extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/img/aabu.jpeg',
    'assets/img/ahijau.jpeg',
    'assets/img/aputih.jpeg',
    'assets/img/abunga.jpeg',
    'assets/img/aabut.jpeg',
    'assets/img/awarna.jpeg',
    'assets/img/asage.jpeg',
    'assets/img/arok.jpeg',
  ];

  ChildPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Koleksi Pakaian Anak-Anak',
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
