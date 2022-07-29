class Song {
  String songName;
  String singer;
  String songImage;
  String song;

  Song(
      {required this.songName,
      required this.singer,
      required this.songImage,
      required this.song});
}

class PlayList {
  final List<Song> _myPlaylists = [
    Song(
        songName: "Ta Gal Lo Myar",
        singer: "Htoo Eain Thin",
        songImage: "het.jfif",
        song: "assets/het.mp3"),
    Song(
        songName: "Htee Ta Chaung",
        singer: "Htet Yan, Grace",
        songImage: "HTC.jfif",
        song: "assets/H.mp3"),
    Song(
        songName: "Yatt Sount",
        singer: "Mg Mg Zaw Latt",
        songImage: "mmzl.jfif",
        song: "assets/YattSount.mp3"),
    Song(
        songName: "Tear of Rain",
        singer: "J Boyz",
        songImage: "tor.jfif",
        song: "assets/tor.mp3"),
    Song(
        songName: "Nway Oo Pone Pyin",
        singer: "Ko Aung",
        songImage: "nopp.jfif",
        song: "assets/nopp.mp3"),
  ];

  getLength() {
    return _myPlaylists.length;
  }

  getSongName(int currentIndex) {
    return _myPlaylists[currentIndex].songName;
  }

  getSinger(int currentIndex) {
    return _myPlaylists[currentIndex].singer;
  }

  getSongImage(int currentIndex) {
    return _myPlaylists[currentIndex].songImage;
  }

  getSong(int currentIndex) {
    return _myPlaylists[currentIndex].song;
  }
}

// List<Song> myPlaylists = [
//     Song(
//         songName: "Ta Gal Lo Myar",
//         singer: "Htoo Eain Thin",
//         songImage: "het.jfif",
//         song: "assets/het.mp3"),
//     Song(
//         songName: "Htee Ta Chaung",
//         singer: "Htet Yan, Grace",
//         songImage: "HTC.jfif",
//         song: "assets/H.mp3"),
//     Song(
//         songName: "Yatt Sount",
//         singer: "Mg Mg Zaw Latt",
//         songImage: "mmzl.jfif",
//         song: "assets/YattSount.mp3"),
//     Song(
//         songName: "Tear of Rain",
//         singer: "J Boyz",
//         songImage: "tor.jfif",
//         song: "assets/tor.mp3"),
//     Song(
//         songName: "Nway Oo Pone Pyin",
//         singer: "Ko Aung",
//         songImage: "nopp.jfif",
//         song: "assets/nopp.mp3"),
    
//   ];