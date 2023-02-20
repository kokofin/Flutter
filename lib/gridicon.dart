
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const Grid());
}

class Grid extends StatelessWidget {
  const Grid({super.key});

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.home,
      Icons.favorite,
      Icons.camera,
      Icons.music_note,
      Icons.book,
      Icons.phone,
      Icons.mail,
      Icons.star,
      Icons.settings,
      Icons.person,
      Icons.shopping_cart,
      Icons.work,
      Icons.directions_bike,
      Icons.local_dining,
      Icons.flight,
      Icons.movie,
      Icons.school,
      Icons.pets,
      Icons.wb_sunny,
      Icons.beach_access,
      Icons.build,
      Icons.chat_bubble,
      Icons.cloud,
      Icons.search,
    ];

    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.pink,
      Colors.purple,
      Colors.orange,
      Colors.teal,
      Colors.amber,
      Colors.deepPurple,
      Colors.lightGreen,
      Colors.deepOrange,
      Colors.indigo,
      Colors.lime,
      Colors.cyan,
      Colors.brown,
      Colors.grey,
      Colors.blueGrey,
      Colors.white,
      Colors.redAccent,
      Colors.blueAccent,
      Colors.greenAccent,
      Colors.yellowAccent,
      Colors.pinkAccent,
      Colors.purpleAccent,
    ];

    Random random = Random();

    return MaterialApp(
      title: 'Tugas gridview',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Tampilan Icon di Hp Arifin'),
        ),
        body: GridView.count(
          crossAxisCount: 4,
          children: List.generate(icons.length, (index) {
            return Center(
              child: Icon(
                icons[index],
                color: colors[random.nextInt(colors.length)],
              ),
            );
          }),
        ),
      ),
    );
  }
}
