import 'package:flutter/material.dart';
import 'package:tiktok_clone/screens/tiktok_screen/widgets/actions_bar.dart';
import 'package:tiktok_clone/screens/tiktok_screen/widgets/tutorial_description.dart';

class TikTokScreen extends StatelessWidget {
  const TikTokScreen({super.key});

  Widget get topSection => Container(
        height: 100.0,
        padding: const EdgeInsets.only(bottom: 15.0, left: 10.0, right: 10.0),
        alignment: const Alignment(0.0, 1.0),
        color: Colors.black,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Row(
                children: [
                  Icon(
                    Icons.lock_clock,
                    color: Colors.grey,
                  ),
                  Text(
                    '10M',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Following',
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    width: 15.0,
                  ),
                  const Text('For you',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ],
              ),
              const Icon(
                Icons.search,
                color: Colors.white,
              )
            ]),
      );

  Widget get middleSection => const Expanded(
          child: Stack(
        children: [
          SizedBox(),
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 80),
                child: Text(
                  "What was the name of the Act that created federal subsidies for the construction of a transcontinental railroad?",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[VideoDescription(), ActionsToolbar()]),
          )
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(0, 37, 51, 1),
        ),
        child: Column(
          children: <Widget>[
            // Top section
            topSection,

            // Middle expanded
            middleSection,

            // Bottom Section
            // BottomToolbar(),
          ],
        ),
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
