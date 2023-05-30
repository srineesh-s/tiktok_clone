part of 'tik_tok_bloc_bloc.dart';

@immutable
abstract class TikTokBlocState {}

class TikTokBlocInitial extends TikTokBlocState {}

class LoadingState extends TikTokBlocState {}

class ForYouSectionSuccessState extends TikTokBlocState {}

class FollowingSectionSuccessState extends TikTokBlocState {}

class AnswerSelectedState extends TikTokBlocState {}

class ErrorState extends TikTokBlocState {}
