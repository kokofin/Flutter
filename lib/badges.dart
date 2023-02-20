import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

void main() => runApp(const TampilkanBadge());

class TampilkanBadge extends StatefulWidget {
  const TampilkanBadge({Key? key}) : super(key: key);


  @override
  State<TampilkanBadge> createState() => _BadgesExampleState();
}

class _BadgesExampleState extends State<TampilkanBadge> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Badges Example',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Badge Arifin'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const badges.Badge(
                badgeContent: Text('3', style: TextStyle(color: Colors.black)),
                child: Icon(Icons.notifications),
              ),
              const SizedBox(height: 20),
              badges.Badge(
                badgeContent: const Text('20', style: TextStyle(color: Colors.yellow)),
                child: Image.network('https://picsum.photos/200'),
              ),
              const SizedBox(height: 20),
              const badges.Badge(
                badgeContent: Text('tes', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
