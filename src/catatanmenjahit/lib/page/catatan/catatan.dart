import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../../dbhelper/sqlhelper.dart';
import '../../models/items.dart';
import 'detail_jahitan.dart';
import 'form_entry.dart';

class CatatanPage extends StatefulWidget {
  const CatatanPage({Key? key}) : super(key: key);

  @override
  State<CatatanPage> createState() => _CatatanPageState();
}

class _CatatanPageState extends State<CatatanPage> {
  int count = 0;
  List<Item> itemList = [];

  @override
  void initState() {
    updateListView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 5),
          Expanded(
            child: createListView(),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Entry()),
                ).then((value) {
                  updateListView();
                });
              },
              backgroundColor: Colors.lightGreen,
              foregroundColor: Colors.white,
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  ListView createListView() {
    TextStyle? textStyle = Theme.of(context).textTheme.headlineSmall;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) => Card(
        color: const Color.fromARGB(255, 227, 241, 210),
        elevation: 20.0,
        child: ListTile(
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: itemList[index].foto.isNotEmpty
                    ? const AssetImage('assets/img/unnamed.jpg')
                    : AssetImage(itemList[index].foto),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            itemList[index].name,
            style: textStyle,
          ),
          subtitle: Text(
            'Tanggal: ${itemList[index].tgl.toString()}\n'
            'Price: Rp.  ${itemList[index].price.toString()}\n',
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                child: const Icon(Icons.edit, color: Colors.blue),
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Entry(item: itemList[index]),
                    ),
                  ).then((value) {
                    updateListView();
                  });
                },
              ),
              const SizedBox(width: 8),
              GestureDetector(
                child: const Icon(Icons.delete, color: Colors.red),
                onTap: () async {
                  await SQLHelper.deleteItem(itemList[index].id);
                  updateListView();
                },
              ),
            ],
          ),
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(item: itemList[index]),
              ),
            );
          },
        ),
      ),
    );
  }

  void updateListView() {
    final Future<Database> dbFuture = SQLHelper.db();
    dbFuture.then((database) {
      Future<List<Item>> itemListFuture = SQLHelper.getItemList();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          count = itemList.length;
        });
      });
    });
  }
}
