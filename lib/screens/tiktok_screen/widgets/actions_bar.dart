import 'package:flutter/material.dart';

class ActionsToolbar extends StatelessWidget {
  // Full dimensions of an action
  static const double actionWidgetSize = 60.0;

// The size of the icon showen for Social Actions
  static const double actionIconSize = 35.0;

// The size of the share social icon
  static const double shareActionIconSize = 25.0;

// The size of the profile image in the follow Action
  static const double profileImageSize = 50.0;

// The size of the plus icon under the profile image in follow action
  static const double plusIconSize = 20.0;

  const ActionsToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        _getScrollButtonAction(),
        _getSocialAction(icon: Icons.heart_broken, title: '87'),
        _getSocialAction(icon: Icons.insert_comment, title: '2'),
        _getSocialAction(icon: Icons.reply, title: '17'),
        _getSocialAction(icon: Icons.bookmark, title: '203'),
        _getSocialAction(icon: Icons.flip_camera_android, title: 'Flip'),
        const SizedBox(height: 15.0),
      ]),
    );
  }

  Widget _getSocialAction({required String title, required IconData icon}) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Column(children: [
          Icon(icon, size: 35.0, color: Colors.grey[300]),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(title,
                style: const TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                )),
          )
        ]));
  }

  Widget _getScrollButtonAction() {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        width: 60.0,
        height: 60.0,
        child: Stack(children: [
          _getScrollPicture(),
        ]));
  }

  Widget _getScrollPicture() {
    return Positioned(
        left: (actionWidgetSize / 2) - (profileImageSize / 2),
        child: Container(
            padding: const EdgeInsets.all(
                1.0), // Add 1.0 point padding to create border
            height: profileImageSize, // profileImageSize = 50.0;
            width: profileImageSize, // profileImageSize = 50.0;
            decoration: BoxDecoration(
                color: Colors.brown,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(profileImageSize / 2)),
            child: const Center(
              child: Icon(
                Icons.dashboard_customize_rounded,
                color: Colors.yellow,
                size: 32,
              ),
            )));
  }
}
