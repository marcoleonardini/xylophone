import 'package:audioplayers/audio_cache.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final AudioCache _audioPlayer = AudioCache();

  List<int> sounds = [1, 2, 3, 4, 5, 6, 7];
  List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple
  ];

  void _playSound(int i) {
    _audioPlayer.play('note$i.wav');
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];
    for (var item in sounds) {
      buttons.add(
        Expanded(
          child: FlatButton(
            onPressed: () => _playSound(item),
            color: colors[item - 1],
          ),
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: buttons),
        ),
      ),
    );
  }
}
