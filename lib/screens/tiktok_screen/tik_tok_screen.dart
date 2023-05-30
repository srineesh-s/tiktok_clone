import 'package:flutter/material.dart';
import 'package:tiktok_clone/screens/tiktok_screen/widgets/actions_bar.dart';
import 'package:tiktok_clone/screens/tiktok_screen/widgets/tutorial_description.dart';

class TikTokScreen extends StatelessWidget {
  const TikTokScreen({super.key});

  Widget get topSection => Container(
        height: 100.0,
        padding: const EdgeInsets.only(bottom: 15.0),
        alignment: const Alignment(0.0, 1.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Row(
                children: [Icon(Icons.lock_clock), Text('10M')],
              ),
              const Text('Following'),
              Container(
                width: 15.0,
              ),
              const Text('For you',
                  style:
                      TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
              const Icon(Icons.search)
            ]),
      );

  Widget get middleSection => const Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("data"),
          Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[VideoDescription(), ActionsToolbar()])
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.amber,
      //   leading: RichText(
      //     text: const TextSpan(
      //       children: [
      //         WidgetSpan(
      //           child: Icon(
      //             Icons.alarm_on_sharp,
      //           ),
      //         ),
      //         TextSpan(
      //           text: " 10M",
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

      backgroundColor: Colors.pink,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // Top section
          topSection,

          // Middle expanded
          middleSection,

          // Bottom Section
          // BottomToolbar(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.black,
        child: const Row(
          children: [
            Icon(
              Icons.play_arrow_outlined,
              color: Colors.white,
            ),
            Text(
              "Playlist.Unit 5:Period 5:1844-1877",
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 13,
            ),
          ],
        ),
      ),
    );
  }
}
