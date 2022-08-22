import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'songCardWidget.dart';
import 'songClassModel.dart';

class HitsStf extends StatefulWidget {
  const HitsStf({Key? key}) : super(key: key);

  @override
  State<HitsStf> createState() => _HitsStfState();
}

class _HitsStfState extends State<HitsStf> {
  AudioPlayer audioPlayer = AudioPlayer();

  PlayList myPlaylists = PlayList();

  var playSongName = "Tal Gal Lo Myar";
  var playSongImage = "het.jfif";
  var playSinger = "Htoo Eain Thin";
  var song = "assets/het.mp3";

  var play_pause = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: DefaultTextStyle(
            style: const TextStyle(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Home",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.greenAccent)),
                            IconButton(
                                onPressed: () {
                                  audioPlayer.pause();
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/', (route) => false);
                                },
                                icon: Icon(
                                  Icons.logout,
                                  color: Colors.grey[200],
                                ))
                          ],
                        ),
                      ),
                      // song

                      Expanded(
                          child: ListView.builder(
                              // itemCount: myPlaylists.length,
                              itemCount: myPlaylists.getLength(),
                              itemBuilder: (context, index) {
                                return SongCard(
                                  songName: myPlaylists.getSongName(index),
                                  singer: myPlaylists.getSinger(index),
                                  image: myPlaylists.getSongImage(index),
                                  onTap: () {
                                    setState(() {
                                      playSongName =
                                          myPlaylists.getSongName(index);
                                      playSinger = myPlaylists.getSinger(index);
                                      playSongImage =
                                          myPlaylists.getSongImage(index);
                                      song = myPlaylists.getSong(index);
                                      if (play_pause == true) {
                                        audioPlayer.play(song, isLocal: true);
                                        play_pause = !play_pause;
                                      } else {
                                        audioPlayer.pause();
                                        play_pause = !play_pause;
                                      }
                                    });
                                  },
                                );
                              }))
                    ],
                  ),
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
                              onPressed: () {
                                var res;
                                if (play_pause == true) {
                                  res = audioPlayer.play(song, isLocal: true);
                                } else {
                                  res = audioPlayer.pause();
                                }
                                setState(() {
                                  play_pause = !play_pause;
                                });
                              },
                              icon: play_pause
                                  ? const Icon(Icons.play_arrow,
                                      color: Colors.green)
                                  : const Icon(Icons.pause,
                                      color: Colors.green))
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
