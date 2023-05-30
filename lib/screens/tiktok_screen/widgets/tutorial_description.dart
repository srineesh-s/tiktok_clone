// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class VideoDescription extends StatelessWidget {
  const VideoDescription({
    Key? key,
    required this.name,
    required this.description,
  }) : super(key: key);

  final String name;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 70.0,
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              description,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
