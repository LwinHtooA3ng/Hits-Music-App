import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {
  String songName;
  String singer;
  String image;
  VoidCallback onTap;
  // Function getVar;

  SongCard({
    Key? key,
    required this.songName,
    required this.singer,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
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
      ),
    );
  }
}