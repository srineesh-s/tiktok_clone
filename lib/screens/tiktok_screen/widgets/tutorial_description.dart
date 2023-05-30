import 'package:flutter/material.dart';

class VideoDescription extends StatelessWidget {
  const VideoDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 70.0,
        padding: const EdgeInsets.only(left: 20.0),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'AP US History',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Topic 5.2: Manifest Destiny #apush5_1'),
          ],
        ),
      ),
    );
  }
}
