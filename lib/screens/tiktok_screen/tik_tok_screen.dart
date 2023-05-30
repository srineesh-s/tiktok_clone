import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tiktok_clone/models/option_model.dart';
import 'package:tiktok_clone/screens/tiktok_screen/bloc/tik_tok_bloc_bloc.dart';
import 'package:tiktok_clone/screens/tiktok_screen/widgets/actions_bar.dart';
import 'package:tiktok_clone/screens/tiktok_screen/widgets/playlist_widget.dart';
import 'package:tiktok_clone/screens/tiktok_screen/widgets/top_bar_buttons.dart';
import 'package:tiktok_clone/screens/tiktok_screen/widgets/tutorial_description.dart';

class TikTokScreen extends StatelessWidget {
  const TikTokScreen({super.key});

  Widget topSection(BuildContext context, TikTokBlocState state) => Container(
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
              TopBarButtons(tikTokBlocState: state),
              const Icon(
                Icons.search,
                color: Colors.white,
              )
            ]),
      );

  Widget middleSection(
          {required String title,
          required String name,
          required String description,
          required String imageUrl}) =>
      Expanded(
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  VideoDescription(
                    name: name,
                    description: description,
                  ),
                  ActionsToolbar(
                    imageUrl: imageUrl,
                  )
                ]),
          )
        ],
      ));
  Widget middleSectionForYouSection(
          {required String title,
          required String name,
          required String description,
          required List<OptionModel> optionModels,
          required String imageUrl}) =>
      Expanded(
          child: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 80, top: 160),
                  child: Column(
                    children: [
                      Text(
                        title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      ListView.builder(
                          itemCount: optionModels.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(top: 28),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                title: Text(
                                  optionModels[index].answer,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            );
                          })
                    ],
                  ))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  VideoDescription(
                    name: name,
                    description: description,
                  ),
                  ActionsToolbar(
                    imageUrl: imageUrl,
                  )
                ]),
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
              flexibleSpace: topSection(context, state),
              backgroundColor: Colors.black),
          body: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 37, 51, 1),
            ),
            child: PageView.builder(
                scrollDirection: Axis.vertical,
                onPageChanged: (value) {
                  if (state is FollowingSectionSuccessState) {
                    BlocProvider.of<TikTokBlocBloc>(context)
                        .add(FollowingSectionEvent());
                  } else if (state is ForYouSectionSuccessState) {
                    BlocProvider.of<TikTokBlocBloc>(context)
                        .add(ForYouSectionEvent());
                  } else {
                    BlocProvider.of<TikTokBlocBloc>(context)
                        .add(FollowingSectionEvent());
                  }
                },
                itemBuilder: (context, index) {
                  if (state is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is FollowingSectionSuccessState) {
                    return Column(
                      children: [
                        middleSection(
                            title: state.followingSectionModel.flashCardFront,
                            name: state.followingSectionModel.user.name,
                            description:
                                state.followingSectionModel.description,
                            imageUrl: state.followingSectionModel.user.avatar),
                        PlayListWidget(
                          playlistData: state.followingSectionModel.playlist,
                        ),
                      ],
                    );
                  } else if (state is ForYouSectionSuccessState) {
                    return Column(
                      children: [
                        middleSectionForYouSection(
                            title: state.forYouSectionModel.question,
                            name: state.forYouSectionModel.user.name,
                            description: state.forYouSectionModel.description,
                            optionModels: state.forYouSectionModel.options,
                            imageUrl: state.forYouSectionModel.user.avatar),
                        PlayListWidget(
                          playlistData: state.forYouSectionModel.playlist,
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: Text("Something went wrong"));
                  }
                }),
          ),
        );
      },
    );
  }
}
