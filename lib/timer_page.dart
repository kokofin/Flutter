import 'package:flutter/material.dart';
import 'dart:async';

class IsiHalamanUtama extends StatefulWidget {
  const IsiHalamanUtama({Key? key}) : super(key: key);

  @override
  IsiHalamanUtamaState createState() => IsiHalamanUtamaState();
}

class IsiHalamanUtamaState extends State<IsiHalamanUtama> {
  int _seconds = 0;
  int _milliseconds = 0;
  bool _isRunning = false;
  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds:10), (timer) {
      setState(() {
        _milliseconds++;
        if (_milliseconds == 100) {
          _seconds++;
          _milliseconds = 0;
        }
      });
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  void _resetTimer() {
    setState(() {
      _seconds = 0;
      _milliseconds = 0 ;
    });
  }

  String _getTimeString() {
    int minutes = _seconds ~/ 60;
    int seconds = _seconds % 60;
    int hours = minutes ~/ 60;
    minutes = minutes % 60;
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
