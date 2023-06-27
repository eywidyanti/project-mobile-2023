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
  late TextEditingController searchController;
  List<Item> searchResults = [];

  @override
  void initState() {
    searchController = TextEditingController();
    updateListView();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 227, 241, 210),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  performSearch(value);
                },
              ),
            ),
            Expanded(
              child: createListView(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
    );
  }

  ListView createListView() {
    List<Item> itemsToDisplay =
        searchController.text.isEmpty ? itemList : searchResults;

    TextStyle? textStyle = Theme.of(context).textTheme.headlineSmall;
    return ListView.builder(
      itemCount: itemsToDisplay.length,
      itemBuilder: (BuildContext context, int index) => Card(
        color: const Color.fromARGB(255, 227, 241, 210),
        child: ListTile(
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: itemsToDisplay[index].foto.isNotEmpty
                    ? const AssetImage('assets/img/unnamed.jpg')
                    : AssetImage(itemsToDisplay[index].foto),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            itemsToDisplay[index].name,
            style: textStyle,
          ),
          subtitle: Text(
            'Tanggal: ${itemsToDisplay[index].tgl.toString()}\n'
            'Price: Rp.  ${itemsToDisplay[index].price.toString()}\n',
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
                      builder: (context) => Entry(item: itemsToDisplay[index]),
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
                  await SQLHelper.deleteItem(itemsToDisplay[index].id);
                  updateListView();
                },
              ),
            ],
          ),
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(item: itemsToDisplay[index]),
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
          performSearch(searchController.text); // Update search results
        });
      });
    });
  }

  void performSearch(String query) {
    searchResults.clear();
    if (query.isNotEmpty) {
      searchResults = itemList
          .where(
              (item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {});
  }
}
