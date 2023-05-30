import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/screens/tiktok_screen/bloc/tik_tok_bloc_bloc.dart';
import 'package:tiktok_clone/screens/tiktok_screen/widgets/actions_bar.dart';
import 'package:tiktok_clone/screens/tiktok_screen/widgets/playlist_widget.dart';
import 'package:tiktok_clone/screens/tiktok_screen/widgets/tutorial_description.dart';

class TikTokScreen extends StatelessWidget {
  const TikTokScreen({super.key});

  Widget topSection(BuildContext context) => Container(
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
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<TikTokBlocBloc>(context)
                          .add(FollowingSectionEvent());
                    },
                    child: const Text(
                      'Following',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    width: 15.0,
                  ),
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<TikTokBlocBloc>(context)
                          .add(ForYouSectionEvent());
                    },
                    child: const Text('For you',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              const Icon(
                Icons.search,
                color: Colors.white,
              )
            ]),
      );

  Widget middleSection(String title) => Expanded(
          child: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 80),
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
              )),
          const Align(
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
    return BlocBuilder<TikTokBlocBloc, TikTokBlocState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              flexibleSpace: topSection(context),
              backgroundColor: Colors.black),
          body: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 37, 51, 1),
            ),
            child: PageView.builder(
                itemCount: 5,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            BlocProvider.of<TikTokBlocBloc>(context)
                                .add(FollowingSectionEvent());
                          },
                          child: const Text("testdddas")),
                      if (state is FollowingSectionSuccessState)
                        middleSection(
                            state.followingSectionModel.flashCardFront),
                      const PlayListWidget(
                        playlistData: "Unit 5:Period 5:1844-1877",
                      ),
                    ],
                  );
                }),
          ),
        );
      },
    );
  }
}
