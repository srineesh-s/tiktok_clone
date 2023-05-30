import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'tik_tok_bloc_event.dart';
part 'tik_tok_bloc_state.dart';

class TikTokBlocBloc extends Bloc<TikTokBlocEvent, TikTokBlocState> {
  TikTokBlocBloc() : super(TikTokBlocInitial()) {
    on<ForYouSectionEvent>((event, emit) {});
  }
}
