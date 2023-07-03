import 'package:catatanmenjahit/page/koleksi/widget/image_detail.dart';
import 'package:flutter/material.dart';

class MalePage extends StatelessWidget {
  final List<String> imageUrls = [
    'https://www.adunbordir.id/wp-content/uploads/2018/01/Model-baju-koko-pria-kombinasi-batik.jpg',
    'https://www.harapanrakyat.com/wp-content/uploads/2020/02/Model-Baju-Koko-Pria-Kombinasi-Berbagai-Gaya-yang-Menarik.jpg',
    'https://i.pinimg.com/736x/9c/0c/51/9c0c51820a7ffdd1bb6a6af28fe34d71.jpg',
    'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//98/MTA-31490386/brd-44261_baju-koko-kombinasi-batik-pria-lengan-panjang-simpel-terbaru-black-m_full09.jpg',
    'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//93/MTA-31490381/brd-44261_baju-koko-kombinasi-batik-lengan-panjang-pria-kamajaya-muslim-wear-gold-blue-m_full27.jpg',
    'https://ds393qgzrxwzn.cloudfront.net/resize/c500x500/cat1/img/images/0/1yFzLxmOAW.jpg',
    'https://id-test-11.slatic.net/p/d46401b8725d66672edd7c1d8d69ffc6.png',
    'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//105/MTA-24694971/no_brand_no_brand_baju_koko_pria_lengan_panjang_terbaru_2021_sultan_tojiro_toyobo_premium_ars_25555_full03_bs0ct9nh.jpg',
  ];

  MalePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Koleksi Pakaian Pria',
            style: TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 170, 219, 113),
      ),
      body: GridView.count(
        crossAxisCount: 2,
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
                child: Image.network(
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
