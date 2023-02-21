// mengimport package material.dart dari Flutter, yang berisi berbagai widget UI.
import 'package:flutter/material.dart';
//package dart:async berisi library untuk mengatur operasi pada aplikasi
import 'dart:async';

//StatefulWidget yaitu suatu widget yang memiliki state yang bisa berubah di dalamnya
class IsiHalamanUtama extends StatefulWidget {
  const IsiHalamanUtama({Key? key}) : super(key: key);

  @override
  //method createState() yang digunakan untuk membuat dan mengembalikan sesuatu dari kelas IsiHalamanUtamaState
  IsiHalamanUtamaState createState() => IsiHalamanUtamaState();
}
class IsiHalamanUtamaState extends State<IsiHalamanUtama> {
  int _seconds = 0; // diinisialisasi dengan nilai 0 pada awalnya karena aplikasi timer akan dimulai dengan waktu 0 detik
  int _milliseconds = 0; // diinisialisasi dengan nilai 0 pada awalnya karena aplikasi timer akan dimulai dengan waktu 0 milidetik.
  bool _isRunning = false; // Ini adalah variabel yang menyimpan status penghitungan waktu. Jika bernilai true, maka waktu sedang dihitung. Jika bernilai false, maka waktu tidak sedang dihitung. Awalnya diinisialisasi dengan nilai false.
  late Timer _timer; // Variabel ini yang di gunakan untuk menghitung waktu dideklarasikan menggunakan late keyword karena nilainya akan diinisialisasi nanti setelah aplikasi berjalan

  //method _startTimer() untuk memulai penghitungan waktu
  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds:10), (timer) { //timer akan dibuat dan dijalankan secara periodik dengan interval 10 milidetik. Setiap kali interval berakhir, fungsi yang didefinisikan sebagai parameter kedua akan dijalankan, dan objek timer akan dikirim sebagai parameter ke fungsi tersebut.
//Saat fungsi setState() dipanggil, nilai variabel _milliseconds akan ditambahkan 1. Jika nilai _milliseconds mencapai 100, maka nilai variabel _seconds akan ditambahkan 1, dan nilai _milliseconds akan diatur kembali menjadi 0.     
      setState(() {
        _milliseconds++;
        if (_milliseconds == 100) {
          _seconds++;
          _milliseconds = 0;
        }
      });
    });
  }
//method _startTimer() untuk menghentikan waktu
  void _stopTimer() {
    _timer.cancel();
  }
////method _resetTimer() untuk mengubah atau mereset waktu
  void _resetTimer() {
    setState(() {
      _seconds = 0;
      _milliseconds = 0 ;
    });
  }
 //Method ini akan mengembalikan waktu yang dihitung berdasarkan variabel _seconds dan _milliseconds dalam format "hh:mm:ss.ms". Variabel _seconds akan dikonversi menjadi menit dan jam jika melebihi batas maksimumnya.
  String _getTimeString() {
    int minutes = _seconds ~/ 60;//menghitung jumlah menit dengan membagi detik dengan 60 menggunakan operator pembagian integer ~/ Hasil pembagian integer ini akan membuang angka di belakang koma sehingga nilai desimalnya tidak dihitung
    int seconds = _seconds % 60;//menghitung sisa detik dengan operator modulus % yang akan mengembalikan sisa dari pembagian _seconds dengan 60
    int hours = minutes ~/ 60;
    minutes = minutes % 60;//menghitung sisa menit setelah menghitung jumlah jam pada baris
//mengembalikan nilai format waktu yang telah dihitung sebelumnya dalam bentuk string dengan menggunakan fungsi toString(). 
  //Fungsi padLeft() digunakan untuk menambahkan nol di depan nilai yang kurang dari 10 sehingga format waktu akan selalu memiliki dua digit untuk masing-masing jam, menit, detik, dan milidetik
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}.${_milliseconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Application Timer Arifin'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _getTimeString(),
            style: const TextStyle(fontSize: 50.0, color: Colors.white),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  if (!_isRunning) {
                    _isRunning = true;
                    _startTimer();
                  }
                },
                child: const Text('Start'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_isRunning) {
                    _isRunning = false;
                    _stopTimer();
                  }
                },
                child: const Text('Stop'),
              ),
              ElevatedButton(
                onPressed: () {
                  _isRunning = false;
                  _stopTimer();
                  _resetTimer();
                },
                child: const Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
