// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tik_tok_bloc_bloc.dart';

@immutable
abstract class TikTokBlocState {}

class TikTokBlocInitial extends TikTokBlocState {}

class LoadingState extends TikTokBlocState {}

class ForYouSectionSuccessState extends TikTokBlocState {
  final ForYouSectionModel forYouSectionModel;
  ForYouSectionSuccessState({
    required this.forYouSectionModel,
  });
}

class FollowingSectionSuccessState extends TikTokBlocState {
  final FollowingSectionModel followingSectionModel;
  FollowingSectionSuccessState({
    required this.followingSectionModel,
  });
}

class AnswerSelectedState extends TikTokBlocState {}

class ErrorState extends TikTokBlocState {}
