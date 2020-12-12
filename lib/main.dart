import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  static const String _title = 'Basisc Phrases';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: _title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String assetsPath = 'assets/';
  final Map<int, String> expressionsPaths = <int, String>{
    0: 'exp1.mp3',
    1: 'exp2.mp3',
    2: 'exp3.mp3',
    3: 'exp4.mp3',
    4: 'exp5.mp3',
    5: 'exp6.mp3',
    6: 'exp7.mp3',
    7: 'exp8.mp3',
    8: 'exp9.mp3',
    9: 'exp10.mp3',
    10: 'exp11.mp3',
    11: 'exp12.mp3',
    12: 'exp13.mp3',
    13: 'exp14.mp3',
  };
  final Map<int, String> romanianTranslations = <int, String>{
    0: 'salut',
    1: 'hello (engleza)',
    2: 'ce faci?',
    3: 'what are you doing? (engleza)',
    4: 'bine, tu?',
    5: 'good, you? (engleza)',
    6: 'sunt bine si eu',
    7: 'i\'m fine too (engleza)',
    8: 'hai la un suc',
    9: 'come to a juice (engleza)',
    10: 'nu ma duc, sunt obosit',
    11: 'i\'m not going, i\'m tired (engleza)',
    12: 'bine pa',
    13: 'goobye (engleza)',
  };
  final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: expressionsPaths.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Material(
              child: Ink(
            decoration: const BoxDecoration(
                gradient: RadialGradient(
                    radius: 0.6, colors: <Color>[Colors.white, Colors.blue]),
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: InkWell(
                splashColor: Colors.white,
                onTap: () {
                  AssetsAudioPlayer.newPlayer().open(
                    Audio(assetsPath + expressionsPaths[index]),
                    autoStart: true,
                    showNotification: true,
                    forceOpen: true,
                  );
                },
                child: Center(
                  child: Text(
                    romanianTranslations[index],
                    textAlign: TextAlign.center,
                  ),
                )),
          ));
        },
      ),
    );
  }
}
