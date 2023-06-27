import 'package:flutter/material.dart';
import '../../models/items.dart';

class DetailPage extends StatefulWidget {
  final Item item;
  const DetailPage({Key? key, required this.item}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Detail Jahitan',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 170, 219, 113),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: <Widget>[
              Text(
                widget.item.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 211, 27, 27)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/img/logo.png',
                ),
              ),
              TextButton(
                child: const Text(
                  'Show Details',
                  style: TextStyle(color: Colors.green),
                ),
                onPressed: () => setState(() {
                  opacity = 1;
                }),
              ),
              AnimatedOpacity(
                duration: const Duration(seconds: 2),
                opacity: opacity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lingkar Dada: ${widget.item.ld.toString()} cm',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Panjang Lengan: ${widget.item.pl.toString()} cm',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Panjang Baju: ${widget.item.pb.toString()} cm',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Panjang Bahu/Pundak: ${widget.item.bp.toString()} cm',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tanggal Selesai: ${widget.item.tgl.toString()}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Price: Rp. ${widget.item.price.toString()}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Keterangan: ${widget.item.ket.toString()}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
