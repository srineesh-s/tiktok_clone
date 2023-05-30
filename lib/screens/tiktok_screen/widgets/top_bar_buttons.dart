import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/screens/tiktok_screen/bloc/tik_tok_bloc_bloc.dart';

class TopBarButtons extends StatelessWidget {
  const TopBarButtons({
    super.key,
    required this.tikTokBlocState,
  });
  final TikTokBlocState tikTokBlocState;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {
            BlocProvider.of<TikTokBlocBloc>(context)
                .add(FollowingSectionEvent());
          },
          child: Text(
            'Following',
            style: TextStyle(
                color: Colors.white,
                fontWeight: tikTokBlocState is FollowingSectionSuccessState
                    ? FontWeight.bold
                    : FontWeight.normal,
                fontSize:
                    tikTokBlocState is FollowingSectionSuccessState ? 20 : 17),
          ),
        ),
        Container(
          width: 15.0,
        ),
        TextButton(
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {
            BlocProvider.of<TikTokBlocBloc>(context).add(ForYouSectionEvent());
          },
          child: Text('For you',
              style: TextStyle(
                fontSize:
                    tikTokBlocState is ForYouSectionSuccessState ? 20 : 17.0,
                fontWeight: tikTokBlocState is ForYouSectionSuccessState
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: Colors.white,
              )),
        )
      ],
    );
  }
}
