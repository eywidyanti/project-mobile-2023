import 'package:catatanmenjahit/page/koleksi/widget/image_detail.dart';
import 'package:flutter/material.dart';

class ChildPage extends StatelessWidget {
  final List<String> imageUrls = [
    'https://evermos.com/home/wp-content/uploads/2022/10/gamis-semi-tunik-dengan-lengan-puff_inspirasi-model-baju-anak-perempuan-terbaru_tampil-modis-dengan-7-model-baju-anak-perempuan-terbaru-berikut.png',
    'https://64.media.tumblr.com/55688c14fff4ba33db057a180f513351/5a4597bc6050d423-da/s1280x1920/da606057068941ef7f460830614921a50b4ae321.jpg',
    'https://id-live-01.slatic.net/p/121b73545850e1bfb3b265f1a09ebe48.jpg',
    'https://p-id.ipricegroup.com/2b5edf721a23706cd01dc2eb7acb84bb03f37a50_0.jpg',
    'https://id-live-01.slatic.net/p/6a554dfbd9c904b9c586e94f1d1853ee.jpg',
    'https://img.priceza.co.id/img2/2130004/0001/2130004-20220723030120-22240361778820168.jpg',
    'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/medium//98/MTA-68800703/no-brand_baju-kemeja-lengan-panjang-russelo-anak-laki-laki_full01.jpg',
    'https://id-live-02.slatic.net/p/d615429bd2df6a6fb949257acfd21793.jpg',
  ];

  ChildPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Koleksi Pakaian Anak',
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
