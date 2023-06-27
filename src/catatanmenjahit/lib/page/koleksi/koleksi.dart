import 'package:flutter/material.dart';

import 'baju_wanita.dart';
import 'baju_anak.dart';
import 'baju_laki.dart';

class KoleksiPage extends StatefulWidget {
  const KoleksiPage({super.key});

  @override
  State<KoleksiPage> createState() => _KoleksiPageState();
}

class _KoleksiPageState extends State<KoleksiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: GridView.count(crossAxisCount: 2, children: [
          MyMenu(
            title: "Wanita",
            icon: Icons.girl_rounded,
            color: Colors.pink,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FemalePage(),
                ),
              );
            },
          ),
          MyMenu(
            title: "Pria",
            icon: Icons.man,
            color: Colors.blue,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MalePage(),
                ),
              );
            },
          ),
          MyMenu(
            title: "Anak-Anak",
            icon: Icons.child_care,
            color: Colors.amber,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChildPage(),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}

class MyMenu extends StatelessWidget {
  const MyMenu(
      {super.key,
      required this.title,
      required this.icon,
      required this.color,
      required this.onTap});

  final String title;
  final IconData icon;
  final MaterialColor color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        splashColor: Colors.green,
        onTap: onTap,
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 70.0,
              color: color,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 17.0),
            )
          ],
        )),
      ),
    );
  }
}
