import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int noteNumber) {
    final player = AudioCache();
    player.play('note$noteNumber.wav');
  }

  Widget buildKey(int keyNumber) {
    List colorCodes = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green[400],
      Colors.green[900],
      Colors.blue,
      Colors.purple,
    ];
    return Expanded(
      child: FlatButton(
        color: colorCodes[keyNumber-1],
        child: null,
        onPressed: () {
          playSound(keyNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(1),
              buildKey(2),
              buildKey(3),
              buildKey(4),
              buildKey(5),
              buildKey(6),
              buildKey(7),
            ],
          ),
        ),
      ),
    );
  }
}
