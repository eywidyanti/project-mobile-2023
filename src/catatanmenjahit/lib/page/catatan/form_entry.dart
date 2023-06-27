import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../../dbhelper/sqlhelper.dart';
import '../../models/items.dart';

class Entry extends StatefulWidget {
  const Entry({
    Key? key,
    this.item,
  }) : super(key: key);
  final Item? item;
  @override
  State<Entry> createState() => EntryFormState();
}

class EntryFormState extends State<Entry> {
  late Item item = Item(
      kode: '',
      name: '',
      foto: '',
      ld: 0,
      pl: 0,
      pb: 0,
      bp: 0,
      tgl: '',
      price: 0,
      ket: '');

  TextEditingController kodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController fotoController = TextEditingController();
  TextEditingController ldController = TextEditingController();
  TextEditingController plController = TextEditingController();
  TextEditingController pbController = TextEditingController();
  TextEditingController bpController = TextEditingController();
  TextEditingController tglController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController ketController = TextEditingController();

  void _showDatePicker(BuildContext context) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1900, 1, 1),
      maxTime: DateTime(2100, 12, 31),
      onChanged: (date) {},
      onConfirm: (date) {
        setState(() {
          tglController.text = date.toString();
        });
      },
      currentTime: DateTime.now(),
      locale: LocaleType.en,
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        fotoController.text = pickedImage.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.item != null) {
      kodeController.text = widget.item!.kode;
      nameController.text = widget.item!.name;
      fotoController.text = widget.item!.foto;
      ldController.text = widget.item!.ld.toString();
      plController.text = widget.item!.pl.toString();
      pbController.text = widget.item!.pb.toString();
      bpController.text = widget.item!.bp.toString();
      tglController.text = widget.item!.tgl.toString();
      priceController.text = widget.item!.price.toString();
      ketController.text = widget.item!.ket;
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: widget.item == null
            ? const Text(
                'Form Jahitan',
                style: TextStyle(
                  color: Colors.black,
                ),
              )
            : const Text(
                'Update Jahitan',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
        backgroundColor: const Color.fromARGB(255, 170, 219, 113),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
            child: TextField(
                controller: kodeController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.shopping_basket),
                    labelText: 'Kode Catatan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                onChanged: (value) {}),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
            child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.people_alt_outlined),
                    labelText: 'Nama Pemesan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                onChanged: (value) {
                  //item.name = value;
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
            child: TextField(
                controller: ldController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.format_size_outlined),
                    labelText: 'Lingkar Dada',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                onChanged: (value) {}),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
            child: TextField(
                controller: plController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.format_size_outlined),
                    labelText: 'Panjang Lengan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                onChanged: (value) {}),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
            child: TextField(
                controller: pbController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.format_size_outlined),
                    labelText: 'Panjang Baju',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                onChanged: (value) {}),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
            child: TextField(
                controller: bpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.format_size_outlined),
                    labelText: 'Bahu/Pundak',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                onChanged: (value) {}),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
            child: TextFormField(
              controller: tglController,
              keyboardType: TextInputType.text,
              onTap: () {
                _showDatePicker(context);
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.date_range),
                labelText: 'Tanggal Selesai',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
            child: TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.money),
                    labelText: 'Harga',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                onChanged: (value) {}),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
            child: TextField(
                controller: ketController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.perm_device_information),
                    labelText: 'Keterangan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                onChanged: (value) {}),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Model Baju',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      fotoController.text.isNotEmpty
                          ? Image.file(
                              File(fotoController.text),
                              width: 200,
                              fit: BoxFit.cover,
                            )
                          : const Placeholder(),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.add_a_photo),
                          onPressed: () {
                            _pickImage();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text(
                    'Save',
                    textScaleFactor: 1.5,
                  ),
                  onPressed: () {
                    if (widget.item == null) {
                      item = Item(
                          kode: kodeController.text,
                          name: nameController.text,
                          foto: fotoController.text,
                          ld: int.parse(ldController.text),
                          pl: int.parse(plController.text),
                          pb: int.parse(pbController.text),
                          bp: int.parse(bpController.text),
                          tgl: tglController.text,
                          price: int.parse(priceController.text),
                          ket: ketController.text);
                      final Future<Database> dbFuture = SQLHelper.db();
                      Future<int> id = SQLHelper.createItem(item);
                    } else {
                      item.id = widget.item!.id;
                      item.kode = kodeController.text;
                      item.name = nameController.text;
                      item.foto = fotoController.text;
                      item.ld = int.parse(ldController.text);
                      item.pl = int.parse(plController.text);
                      item.pb = int.parse(pbController.text);
                      item.bp = int.parse(bpController.text);
                      item.tgl = tglController.text;
                      item.price = int.parse(priceController.text);
                      item.ket = ketController.text;
                      SQLHelper.updateItem(item);
                    }

                    Navigator.pop(context, item);
                  },
                )),
                Container(
                  width: 10.0,
                ),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.cancel),
                    label: const Text(
                      'Cancel',
                      textScaleFactor: 1.5,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 167, 166, 166),
                    ),
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
