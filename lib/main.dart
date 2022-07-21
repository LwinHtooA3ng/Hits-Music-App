import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const HitsStl());

class HitsStl extends StatelessWidget {
  const HitsStl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hits Songs App',
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: HitsStf(),
          ),
        ),
      ),
    );
  }
}

class HitsStf extends StatefulWidget {
  const HitsStf({Key? key}) : super(key: key);

  @override
  State<HitsStf> createState() => _HitsStfState();
}

class _HitsStfState extends State<HitsStf> {
  AudioPlayer audioPlayer = AudioPlayer();

  var playSongName = "Tal Gal Lo Myar";
  var playSongImage = "het.jfif";
  var playSinger = "Htoo Eain Thin";
  var song = "assets/het.mp3";

  var play_pause = true;

  void getVar(a, b, c) {
    setState(() {
      this.playSongName = a;
      this.playSongImage = b;
      this.playSinger = c;
    });
  }

  playSong(a, b, c, d) {
    return GestureDetector(
      onTap: () {
        setState(() {
          this.playSongName = a;
          this.playSinger = b;
          this.playSongImage = c;
          this.song = d;
          if (play_pause == true) {
            audioPlayer.play(this.song, isLocal: true);
            this.play_pause = !play_pause;
          } else {
            audioPlayer.pause();
            this.play_pause = !play_pause;
          }
        });
      },
      child: SongCard(
        songName: a,
        singer: b,
        image: c,
        // getVar: getVar(a, b, c),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Home",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.greenAccent)),
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              // song
              playSong("Tal Gal Lo Myar", "Htoo Eain Thin", "het.jfif",
                  "assets/het.mp3"),
              playSong("Htee Ta Chaung", "Htet Yan, Grace", "HTC.jfif",
                  "assets/H.mp3"),
              playSong("Yatt Sount", "Mg Mg Zaw Latt", "mmzl.jfif",
                  "assets/YattSount.mp3"),
              playSong("Tear of Rain", "J Boyz", "tor.jfif", "assets/tor.mp3"),
              playSong("Nway Oo Pone Pyin", "The Ants", "nopp.jfif",
                  "assets/nopp.mp3"),
            ],
          ),
          // play card
          Card(
            // elevation: 2,
            color: Colors.grey[200],
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage("images/$playSongImage"),
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              playSongName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800]),
                            ),
                            Text(
                              playSinger,
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Icon
                    IconButton(

                      // using async await
                        // onPressed: () async {
                        //   var res;
                        //   if (play_pause == true) {
                        //     res = await audioPlayer.play(this.song,
                        //         isLocal: true);
                        //     // print(res);
                        //     // res = await audioPlayer.play(
                        //     //     'https://msicoursematerial.s3.us-west-2.amazonaws.com/Coldplay+X+Selena+Gomez+-+Let+Somebody+Go+(Official+Video).mp3');
                        //   } else {
                        //     res = await audioPlayer.pause();
                        //   }
                        //   if (res == 1) {
                        //     setState(() {
                        //       play_pause = !play_pause;
                        //     });
                        //   }
                        // },

                        onPressed: () {
                          var res;
                          if (play_pause == true) {
                            res = audioPlayer.play(this.song, isLocal: true);
                          } else {
                            res = audioPlayer.pause();
                          }
                          setState(() {
                            play_pause = !play_pause;
                          });
                        },
                        icon: play_pause
                            ? const Icon(Icons.play_arrow, color: Colors.green)
                            : const Icon(Icons.pause, color: Colors.green))
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

class SongCard extends StatelessWidget {
  String songName;
  String singer;
  String image;
  // Function getVar;

  SongCard({
    Key? key,
    required this.songName,
    required this.singer,
    required this.image,
    // required this.getVar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Row(
          children: [
            Image(
              image: AssetImage("images/$image"),
              width: 50,
              height: 50,
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.songName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[800]),
                ),
                Text(
                  this.singer,
                  style: TextStyle(color: Colors.grey[600], fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
