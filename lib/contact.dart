

import 'package:flutter/material.dart';

void main() {
  runApp(const KontakHp());
}

class Contact {
  String username;
  String phone;

  Contact(this.username, this.phone);
}

List<Contact> contacts = [
  Contact("PurplePenguin22", "(555) 123-4567"),
  Contact("GreenGiraffe99", "(555) 234-5678"),
  Contact("SilverSunshine11", "(555) 345-6789"),
  Contact("BlueButterfly44", "(555) 456-7890"),
  Contact("GoldenDragonfly77", "(555) 567-8901"),
  Contact("RedRainbow66", "(555) 678-9012"),
  Contact("OrangeMeadow55", "(555) 789-0123"),
  Contact("YellowNightfall33", "(555) 890-1234"),
  Contact("BlackStarlight88", "(555) 901-2345"),
  Contact("PinkMoonstone77", "(555) 012-3456")
];

class KontakHp extends StatelessWidget {
  const KontakHp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Kontak Hp Arifin'),
        ),
        body: const ListContactHp(),
      ),
    );
  }
}

class ListContactHp extends StatelessWidget {
  const ListContactHp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(contacts[index].username),
          subtitle: Text(contacts[index].phone),
          leading: CircleAvatar(
            backgroundColor: Colors.black,
            child: Text(
              contacts[index].username.substring(0, 1),// kode ini digunakan untuk mengambil karakter pertama dari string username pada objek Contact 
              //dengan indeks pada daftar kontak.Metode substring digunakan untuk mengambil sebagian karakter dari sebuah string
              style: const TextStyle(color: Colors.white),
            ),
          ),
          //kode yang menambahkan sebuah icon panggilan pada ListTile di sebelah kanan
          trailing: const Icon(Icons.call),
          onTap: () {
            // action when the list tile is tapped
          },
        );
      },
    );
  }
}
