import 'package:flutter/material.dart';

class PlayListWidget extends StatelessWidget {
  const PlayListWidget({super.key, required this.playlistData});

  final String playlistData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.black,
      child: Row(
        children: [
          const Icon(
            Icons.play_arrow_outlined,
            color: Colors.white,
          ),
          Text(
            "Playlist.$playlistData",
            style: const TextStyle(color: Colors.white),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 13,
          ),
        ],
      ),
    );
  }
}
