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
        _getFollowAction(),
        _getSocialAction(icon: Icons.heart_broken, title: '3.2m'),
        _getSocialAction(icon: Icons.insert_comment, title: '16.4k'),
        _getSocialAction(icon: Icons.reply, title: 'Share', isShare: true),
        _getSocialAction(icon: Icons.bookmark, title: 'Share', isShare: true),
        _getMusicPlayerAction()
      ]),
    );
  }

  Widget _getSocialAction(
      {required String title, required IconData icon, bool isShare = false}) {
    return Container(
        margin: const EdgeInsets.only(top: 15.0),
        width: 60.0,
        height: 60.0,
        child: Column(children: [
          Icon(icon, size: isShare ? 25.0 : 35.0, color: Colors.grey[300]),
          Padding(
            padding: EdgeInsets.only(top: isShare ? 5.0 : 2.0),
            child:
                Text(title, style: TextStyle(fontSize: isShare ? 10.0 : 12.0)),
          )
        ]));
  }

  Widget _getFollowAction() {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        width: 60.0,
        height: 60.0,
        child: Stack(children: [_getProfilePicture(), _getPlusIcon()]));
  }

  Widget _getPlusIcon() {
    return Positioned(
      bottom: 0,
      left: ((actionWidgetSize / 2) - (plusIconSize / 2)),
      child: Container(
          width: plusIconSize, // plusIconSize = 20.0;
          height: plusIconSize, // plusIconSize = 20.0;
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 43, 84),
              borderRadius: BorderRadius.circular(15.0)),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 20.0,
          )),
    );
  }

  Widget _getProfilePicture() {
    return Positioned(
        left: (actionWidgetSize / 2) - (profileImageSize / 2),
        child: Container(
          padding: const EdgeInsets.all(
              1.0), // Add 1.0 point padding to create border
          height: profileImageSize, // profileImageSize = 50.0;
          width: profileImageSize, // profileImageSize = 50.0;
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(profileImageSize / 2)),
          // import 'package:cached_network_image/cached_network_image.dart'; at the top to use CachedNetworkImage
          child: const Text("image appears"),
        ));
  }

  Widget _getMusicPlayerAction() {
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        width: actionWidgetSize,
        height: actionWidgetSize,
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(11.0),
            height: profileImageSize,
            width: profileImageSize,
            decoration: BoxDecoration(
                // gradient: musicGradient,
                color: Colors.pink,
                borderRadius: BorderRadius.circular(profileImageSize / 2)),
            child: const Text("Image appearts"),
          ),
        ]));
  }
}
