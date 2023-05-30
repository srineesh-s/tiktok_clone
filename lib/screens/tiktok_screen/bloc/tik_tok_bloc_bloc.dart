import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/models/following_section_model.dart';
import 'package:tiktok_clone/models/for_you_section_model.dart';
import 'package:tiktok_clone/screens/tiktok_screen/repository/tiktok_repository.dart';

part 'tik_tok_bloc_event.dart';
part 'tik_tok_bloc_state.dart';

class TikTokBlocBloc extends Bloc<TikTokBlocEvent, TikTokBlocState> {
  TikTokBlocBloc(this._tikTokSectionRepository) : super(TikTokBlocInitial()) {
    on<FollowingSectionEvent>((event, emit) async {
      emit(LoadingState());
      try {
        FollowingSectionModel model =
            await _tikTokSectionRepository.getFollowingSection();
        emit(FollowingSectionSuccessState(followingSectionModel: model));
      } catch (e) {
        emit(ErrorState());
      }
    });
    on<ForYouSectionEvent>((event, emit) async {
      emit(LoadingState());
      try {
        ForYouSectionModel model =
            await _tikTokSectionRepository.forYouSeciton();
        emit(ForYouSectionSuccessState(forYouSectionModel: model));
      } catch (e) {
        emit(ErrorState());
      }
    });
  }

  final TikTokSectionRepository _tikTokSectionRepository;
}
