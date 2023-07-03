import 'package:catatanmenjahit/page/koleksi/widget/image_detail.dart';
import 'package:flutter/material.dart';

class FamalePage extends StatelessWidget {
  final List<String> imageUrls = [
    'https://hariansinggalang.co.id/wp-content/uploads/2022/03/baju.jpg',
    'https://storage.googleapis.com/hijup-production-sg-magazine/2022/12/4f37a608-atasan-simple-dengan-saku-jumbo.jpeg',
    'https://naisha.id/blog/wp-content/uploads/2020/09/baju-atasan-batik-wanita-11-3.jpg',
    'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/indizone/2022/12/13/x0sL9ro/7-inspirasi-model-baju-natal-wanita-yang-bagus-terbaru-202244.jpg',
    'https://img2.biggo.com/s6doUzVzdakUGzVJv1c4YVhxTQXdDMFSGya5XfaZrrg4/https://id-live-01.slatic.net/p/1f4f660d3aadd8abed244f495839a330.jpg',
    'https://ds393qgzrxwzn.cloudfront.net/resize/m400x400/cat1/img/images/0/3GCniYpsm1.jpg',
    'https://cekbarang.id/image/aHR0cHM6Ly9jZi5zaG9wZWUuY28uaWQvZmlsZS9jYjgxM2JhMTIwY2JlMjYzMzJiN2JiM2E1ZGZjNDc5NF90bg==.png',
    'https://cdn1.katadata.co.id/media/images/2022/04/12/batik_1-2022_04_12-21_59_03_6c851670beee739e6548d14e058a6211.jpg',
  ];

  FamalePage({Key? key}) : super(key: key);

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
